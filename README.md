# Bash-installer-menu
Bash menu for Cinnamon on Ubuntu server
---
Conversion of the shell script to a bash menu version

See: https://github.com/wingarmac/software-install

- - - 


**Purpose:**

Only for Ubuntu server (22.04 tested) and installation of the Cinnamon Desktop

**Prerequisite:** [dialog](https://launchpad.net/ubuntu/+source/dialog)

A check to verify its presence has been added at the start of the script. The package will be installed automatically if needed.

- - -

![Screenshot from 2023-01-30 16-57-34](https://user-images.githubusercontent.com/78303089/215549331-f3c7dd01-08d0-4018-8866-e061fe7fb981.png)

What it does:
---
- It resolves known issues with sound on Ubuntu and the Cinnamon network applet.

  [For more details about the network applet issue here](https://askubuntu.com/questions/1135755/network-manager-applet-shows-not-connected-and-one-unmanaged-wired-connection/1439162#1439162)

  [For more information about the trouble with sound on Ubuntu](https://askubuntu.com/questions/1436904/problem-with-sound-in-ubuntu-22-10/1440458#1440458)

- It makes it easy to add the Mint backports for Cinnamon install on Ubuntu
- It let you select the proprietary driver to install for graphics

  Since I only use Nvidia drivers on my computer, I just did add the version I personally need.

- It has an option to update the Ubuntu kernel to its last release
- It has a menu to install additional software from a It has a menu to install additional packages from the installation.txt file. 
- This is togheter in a submenu with a command to export to installation.txt all what has been installed with the `apt install` command manually.
- And 3th party software options I like to use, that uses `dpkg -i` to be installed.

- - -
**Usage:**
---

`git clone https://github.com/wingarmac/Bash-installer-menu.git`

`cd Bash-installer-menu`

`chmod a+x Installer-menu`

`sudo ./Installer-menu`



- - -
 
