#!/bin/sh
# Export all installed packages
# Output file: installation.txt

# Extract manually installed packages from APT history log
awk -F'll ' '  '/apt install/ && !/nvidia/ && !/--/ && !/-f/{ print $2 }' /var/log/apt/history.log > installation.txt

# Append all installed packages using dpkg
dpkg -l | grep ^ii | awk '{ print $2 }' >> installation.txt

echo "Packages exported to installation.txt. Back to Installer-menu after 5 sec."
sleep 5
bash Installer-menu
