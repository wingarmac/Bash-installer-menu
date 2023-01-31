#!/bin/sh
# Export manualy installed packages 
# Packages installed with apt install from terminal excl.
# Output file: installation.txt

awk -F'll ' '  /apt install/ && !/nvidia/ && !/--/ && !/-f/{ print $2 }  ' /var/log/apt/history.log >installation.txt;
echo "Packages exported to installation.txt. Back to Installer-menu after 5 sec.";
sleep 5;
bash Installer-menu;
