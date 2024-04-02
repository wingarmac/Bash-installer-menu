#!/bin/bash

# Present the choice in a simple text menu
echo "Choose Display Server:"
echo "1. Xorg (Traditional display server)"
echo "2. Wayland (Modern display server with improved performance and security)"
read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    sudo apt install -y xorg slick-greeter lightdm-settings mutter muffin cinnamon yaru-theme-icon oxygen-cursor-theme gnome-software numlockx virt-manager
    sudo apt install -y aptitude gnome-terminal gpart gparted gnome-disk-utility wireguard openvswitch-switch resolvconf gnome-screenshot gnome-settings-daemon 
    sudo apt install -y gnome-system-monitor gnome-text-editor gnome-themes-extra gimp fail2ban findutils hexchat net-tools nfs-common 
    sudo apt install -y ubuntu-drivers-common ubuntu-minimal ubuntu-mono ubuntu-release-upgrader-core ubuntu-server ubuntu-settings ubuntu-standard
    ;;
  2)
    sudo apt install -y wayland-protocols libwayland* muffin mutter slick-greeter yaru-theme-icon oxygen-cursor-theme gnome-software numlockx virt-manager
    sudo apt install -y aptitude gnome-terminal gpart gparted gnome-disk-utility wireguard openvswitch-switch resolvconf gnome-screenshot gnome-settings-daemon 
    sudo apt install -y gnome-system-monitor gnome-text-editor gnome-themes-extra gimp fail2ban findutils hexchat net-tools nfs-common xserver-xephyr
    sudo apt install -y ubuntu-drivers-common ubuntu-minimal ubuntu-mono ubuntu-release-upgrader-core ubuntu-server ubuntu-settings ubuntu-standard
    ;;
  *)
    echo "Invalid choice."
    exit 1
esac
