#!/bin/bash

# Present the choice in a simple text menu
echo "Choose Display Server:"
echo "1. Xorg (Traditional display server)"
echo "2. Wayland (Modern display server with improved performance and security)"
read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    sudo apt install -y xorg slick-greeter lightdm-settings mutter muffin cinnamon yaru-theme-icon oxygen-cursor-theme gnome-software numlockx
    ;;
  2)
    sudo apt install -y wayland-protocols libwayland* mutter slick-greeter yaru-theme-icon oxygen-cursor-theme gnome-software
    ;;
  *)
    echo "Invalid choice."
    exit 1
esac
