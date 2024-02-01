#!/bin/bash

function pause() {
  read -rp "Press Enter to continue..."
}

echo "Steam installer"
pause

echo "GPG install"
pause
wget -O /usr/share/keyrings/steam.gpg https://repo.steampowered.com/steam/archive/stable/steam.gpg
echo "Done !"


echo "Repo install"
pause
sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'
deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
EOF
echo "Done !"


echo "Add i386 arch and update"
pause
sudo dpkg --add-architecture i386
sudo apt-get update
echo "Done !"


echo "Installing Steam Launcher"
pause
sudo apt-get install \
  libgl1-mesa-dri:amd64 \
  libgl1-mesa-dri:i386 \
  libgl1-mesa-glx:amd64 \
  libgl1-mesa-glx:i386 \
  steam-launcher
echo "Done !"
pause
