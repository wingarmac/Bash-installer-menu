#!/bin/bash

# Allows to read from the end of a pipeline without the data 'disappearing'.
# Explained further at http://mywiki.wooledge.org/BashFAQ/024, if you dare.
shopt -s lastpipe

width=120
height=40
menu_height=20
backtitle='Disk-menu'
title='Device selection'

# Will store the menu numbers and (nicely formatted) lsblk lines as pairs.
# Later given to dialog as individual arguments.
choices=()

# Arrays to store the properties of a device according to a particular lsblk
# field.  At the very least, one needs to be able to look up the kname from the
# choice number.
knames=()
uuids=()
mountpoints=()
sizes=()

# Array indexes normally start from 0 in bash but, for the benefit of dialog,
# let's start from 1.
i=1

# This is a three part pipeline. The third part is the while loop.
lsblk -rno type,kname,uuid,mountpoint,size |
column -t -s ' ' |
while read -r line; do
	# We just read the (nicely formatted) line. Now split the line into
	# individual fields, assigning to bash variables.
	echo "$line" | read -r type kname uuid mountpoint size

	if [[ $type != part ]]; then
		# It's not a partition. Proceed directly to the next line.
		continue
	fi

	# Insert the line into the choices array for later use by dialog. Note that
	# two items are being appended to the array - the index number and the line
	# itself.
	choices+=("$i" "$line")

	# Stash the fields so that they be later looked up by the choice number.
	knames[i]=$kname
	uuids[i]=$uuid
	sizes[i]=$size

	# The mountpoint column output by lsblk may contain backslash-escape
	# sequences. This happens when the mountpoint contains whitespace or other
	# unusual characters. bash is able to decode properly with printf.
	mountpoints[i]=$(printf %b "$mountpoint")

	# Increment the index number for the next added device, if any.
	i=$((i + 1))
done

i=$(
	dialog \
		--clear \
		--stdout \
		--backtitle "$backtitle" \
		--title "$title" \
		--menu "Select partition (1-${#knames[@]}): " \
		"$height" "$width" "$menu_height" "${choices[@]}"
)

# Check whether i is empty, indicating that no choice was made.
if [[ ! $i ]]; then
	echo "No partition was selected. Aborting" >&2
	exit 1
fi

#################################################################################
# This is based on a copy of fstab in the script folder 
# It still needs to be set to /etc/fstab

# Swap installation - Replacement of default swap

# Detect if mounted goto error prompt
# I still need to implement this.
# echo the partition selected is already mounted


# fstab backup
# cp -v /etc/fstab /etc/fstab.backup

# Replacement of default swap in fstab:
ID="UUID=${uuid}"
MP="${ID} none	swap	swap	0	0"
sed -i "/swap/c $MP" fstab

# Create /etc/initramfs-tools/conf.d/resume file  
printf "RESUME=$ID\n" > resume # This should add a new line instead, if the file already exists.

# exec '/sbin/mkswap /dev/$kname'
echo "/sbin/mkswap /dev/$kname"

# swapon -U #UUID #/dev/$kname
echo "swapon -U $UUID /dev/$kname"

# update-initramfs -u -k all 
echo update-initramfs -u -k all

