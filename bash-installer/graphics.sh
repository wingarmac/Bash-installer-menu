#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo ubuntu-drivers autoinstall -y

# Get the list of available drivers
drivers=$(sudo ubuntu-drivers list)

# Present the choice in a simple text menu
echo "Choose a driver:"
select driver in $drivers "Quit"; do
    case $driver in
        "Quit")
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "You selected: $driver"
            # Extract the driver package name from the selected driver string
            driver_package=$(echo "$driver" | cut -d',' -f1 | awk '{$1=$1};1')
            # Install the selected driver package
            sudo apt install -y $driver_package
            break
            ;;
    esac
done


