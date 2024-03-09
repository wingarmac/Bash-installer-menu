#!/bin/bash

REQUIRED_PKG="dialog"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: "$PKG_OK"
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt install -y $REQUIRED_PKG
fi

# Present the choice using dialog
choice=$(dialog --title "Choose Display Server" --radiolist "Pick the display server you want to use:" 15 50 2 \
          "Xorg" "Traditional display server" off \
          "Wayland" "Modern display server with improved performance and security" off)

case $choice in
  "Xorg")
    sudo apt install -y xorg slick-greeter lightdm-settings mutter muffin cinnamon yaru-theme-icon oxygen-cursor-theme gnome-software numlockx
    ;;
  "Wayland")
    sudo apt install -y mutter lightdm-wayland-session yaru-theme-icon oxygen-cursor-theme gnome-software
    ;;
  *)
    echo "Invalid choice."
    exit 1
esac
