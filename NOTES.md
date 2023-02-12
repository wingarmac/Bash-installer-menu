**Notes Disk-menu :**
---
 - $buid : the unmounted device is my swap - Its not listed in this variable
 - I like how its shown - but I should look after another command that list all available partitions with /dev/ and UUID
 - After that, I should try to apply it to the current menu choice.

**Commands to process:**
 1. Check how to stop on error (if one of these steps do not work it should stop to be able to verify and create necessary partitions)
 2. Check for how to delete line with swp string and add line with swp string in fstab refering to the selected device
 3. create /etc/initramfs-tools/conf.d/resume file needed entries for selected devices
 4. /sbin/mkswap /dev/$selected
 5. swapon -U #selected_UID #/dev/$selected 
 6. update-initramfs -u -k all
 
 
