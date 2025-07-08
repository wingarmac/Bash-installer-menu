#!/bin/bash

echo "Third-Party Software Installation Menu:"
echo "1. Install Google Chrome"
echo "2. Install Webmin"
echo "3. Install BeID"
echo "4. Install Unified Remote"
echo "5. Install Steam Launcher"
echo "0. Back to main menu"

read -p "Enter your choice: " choice

case $choice in
    1)
        # Commands to install Google Chrome
        echo "Installing Google Chrome..."
        # Download the latest stable Google Chrome .deb package
        # -q for quiet output from wget
        wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb

        # Install the package and fix broken dependencies in one go
        # Using -y for automatic yes to prompts
        # && ensures the next command only runs if the previous one succeeded
        sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo apt --fix-broken install -y

        # Prompt to set Google Chrome as the default browser
        read -p "Do you want to set Google Chrome as your default web browser? (y/N): " set_default_choice
        if [[ "$set_default_choice" =~ ^[Yy]$ ]]; then
            echo "Setting Google Chrome as the default web browser..."
            xdg-settings set default-web-browser google-chrome.desktop
            echo "Google Chrome has been set as your default browser."
        else
            echo "Google Chrome will not be set as the default browser."
        fi

        # Clean up the downloaded .deb file
        rm -f google-chrome-stable_current_amd64.deb
        echo "Google Chrome installation complete."
        ;;
    2)
        # Commands to install Webmin
        sudo curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
        sudo sh setup-repos.sh
        sudo apt-get install -y webmin --install-recommends
        ;;
    3)
        # Commands to install BeID
        wget https://eid.belgium.be/sites/default/files/software/eid-archive_2022.6_all.deb
        sudo dpkg -i eid-archive_2022.6_all.deb
        sudo apt-get install -y eid-mw eid-viewer opensc-pkcs11 libpam-pkcs11 pcscd libpcsclite1 pcscd pcsc-tools
        sudo service pcscd start
        sudo systemctl enable pcscd
        sudo systemctl start pcscd
        ;;
    4)
        # Commands to install Unified Remote
        wget https://www.unifiedremote.com/download/linux-x64-deb
        sudo dpkg -i linux-x64-deb
        sudo apt-get update -y
        sudo apt-get install -f -y
        ;;
    5)
        # Commands to install Steam Launcher
        source steam.sh
        ;;
    0)
        echo "Returning to main menu..."
        ;;
    *)
        echo "Invalid choice. Returning to main menu..."
        ;;
esac
