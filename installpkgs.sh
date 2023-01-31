#!/bin/sh
# Install package list
for pkg in `cat installation.txt`; do sudo apt-get install -y $pkg; done;
echo "Packages installed from installation.txt. Back to Installer-menu after 5 sec.";
sleep 5;
bash Installer-menu;

