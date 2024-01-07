#!/bin/bash

# Menu options
options=(
    "Update and Upgrade"
    "Install Desktop Environment"
    "Install Graphics Drivers"
    "Resolve Desktop Applet Issue"
    "Third-Party Software Installation"
    "Exit"
)

# Function to perform actions based on selection
perform_action() {
    case $1 in
        1)
            ./updater.sh
            ;;
        2)
            ./cinnamon.sh
            ;;
        3)
            ./graphics.sh
            ;;
        4)
            ./resolver.sh
            ;;
        5)
            clear;
	    ./3th-part.sh
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
}

# Display menu options and prompt for choice
while true; do
    clear
    echo "Ubuntu Server Post Installation Steps for Custom Cinnamon Desktop"
    echo "Automatically selecting 'yes' for all steps..."
    echo
    
    # Display menu options
    for ((i=0; i<${#options[@]}; i++)); do
        echo "$((i+1)). ${options[$i]}"
    done
    
    read -p "Enter your choice (1-${#options[@]}): " choice
    
    # Validate and perform action based on choice
    if [[ $choice -ge 1 && $choice -le ${#options[@]} ]]; then
        perform_action "$choice"
    else
        echo "Invalid choice. Please select a valid option."
    fi
done
