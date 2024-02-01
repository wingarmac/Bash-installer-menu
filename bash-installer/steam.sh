#!/bin/bash

# echo Title: Steam installer
echo "# echo Title: Steam installer"

# echo GPG install
echo "Download with wget steam.gpg from: https://repo.steampowered.com/steam/archive/stable/steam.gpg to: /usr/share/keyrings/steam.gpg"
wget -O /usr/share/keyrings/steam.gpg https://repo.steampowered.com/steam/archive/stable/steam.gpg
echo "# echo Done !"

# echo Repo install
echo "$ sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'"
echo "deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam"
echo "deb-src [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam"
echo "EOF"
sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'
deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
EOF
echo "# echo Done !"

# echo add i386 arch and update
echo "$ sudo dpkg --add-architecture i386"
sudo dpkg --add-architecture i386
echo "$ sudo apt-get update"
sudo apt-get update
echo "# echo Done !"

# echo Installing Steam Launcher
echo "$ sudo apt-get install \\"
echo "  libgl1-mesa-dri:amd64 \\"
echo "  libgl1-mesa-dri:i386 \\"
echo "  libgl1-mesa-glx:amd64 \\"
echo "  libgl1-mesa-glx:i386 \\"
echo "  steam-launcher"
sudo apt-get install \
  libgl1-mesa-dri:amd64 \
  libgl1-mesa-dri:i386 \
  libgl1-mesa-glx:amd64 \
  libgl1-mesa-glx:i386 \
  steam-launcher

# echo done
echo "# echo done"

