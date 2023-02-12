**Notes Disk-menu :**
---
 - `$buid` : the unmounted device is my swap - Its not listed in this variable
 - I like how its shown - but I should look after another command that list all available partitions with `/dev/` and UUID like blkid
 - `lsblk --output MOUNTPOINT,UUID`
    

 - After that, I should try to apply it to the current menu choice.

**Commands to process:**
 1. Check how to stop on error (if one of these steps do not work it should stop to be able to verify and create necessary partitions)
 2. Check for how to delete line with swp string and add line with swp string in fstab refering to the selected device
 3. create `/etc/initramfs-tools/conf.d/resume` file needed entries for selected devices
 4. `/sbin/mkswap /dev/$selected`
 5. `swapon -U #selected_UID #/dev/$selected `
 6. `update-initramfs -u -k all`
 
 Usefull links:
 
 - https://sleeplessbeastie.eu/2021/06/25/how-to-export-block-devices-list-as-json/
 - https://mywiki.wooledge.org/BashFAQ/001
 - https://linux.die.net/man/1/dialog
 - https://mywiki.wooledge.org/BashFAQ/040
 - https://unix.stackexchange.com/questions/12858/how-to-change-filesystem-uuid-2-same-uuid
 - https://serverfault.com/questions/3132/how-do-i-find-the-uuid-of-a-filesystem
 
