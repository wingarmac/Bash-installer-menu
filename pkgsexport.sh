#!/bin/sh
# Export manualy installed packages 
# Packages installed with apt install from terminal excl.
# Output file: installation.txt

awk -F'll ' '  /apt install/ && !/nvidia/ && !/--/ && !/-f/{ print $2 }  ' /var/log/apt/history.log >installation.txt
