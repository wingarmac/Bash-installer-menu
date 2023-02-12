**Notes Disk-menu :**
---
**New menu creation : [Disk-menu](https://github.com/wingarmac/Bash-installer-menu/blob/main/disk-menu) (dev)**
- - -
*It will be added afterwards to a submenu of the Installer-menu*

**First objectif:** Be able to replace the default swap with selected device

I've a small M.2 drive that is very fast, where I've 2 partitions of approx. 10Gb each on it. The remaining 100Gb is my `/srv` mount.
One should be for swap mount and the other for `/tmp`
I would like to have a menu to select it so the settings are prepared to be ready for the next reboot.

**First step:** create a device selection menu 

Attempt to create a menu with available devices in order to select the wanted device and replace the default swap.

---
 - `$buid` : the unmounted device is my swap - Its not listed in this variable
 - I like how its shown - but I should look after another command that list all available partitions with `/dev/` and UUID like blkid
 - `lsblk --output MOUNTPOINT,UUID`

    ***Solved with the help of the IRC [#bash](http://mywiki.wooledge.org/BashGuide) Channel***
    
    ***Many thanks to all for your help so far especially to the one that did send me the code corrections !!!***
- - - 
    

 - After that, I should try to apply it to the current menu choice.

**Commands to process:**
 1. Check how to stop on error (if one of these steps do not work it should stop to be able to verify and create necessary partitions)
 2. Check for how to delete line with swp string and add line with swp string in fstab refering to the selected device
 3. create `/etc/initramfs-tools/conf.d/resume` file needed entries for selected devices
 4. `/sbin/mkswap /dev/$selected`
 5. `swapon -U #selected_UID #/dev/$selected `
 6. `update-initramfs -u -k all`
 
 **References:**
 
 - https://sleeplessbeastie.eu/2021/06/25/how-to-export-block-devices-list-as-json/
 - https://mywiki.wooledge.org/BashFAQ/001
 - https://linux.die.net/man/1/dialog
 - https://mywiki.wooledge.org/BashFAQ/040
 - https://unix.stackexchange.com/questions/12858/how-to-change-filesystem-uuid-2-same-uuid
 - https://serverfault.com/questions/3132/how-do-i-find-the-uuid-of-a-filesystem
 
