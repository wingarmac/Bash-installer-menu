#!/bin/bash

# Detect and install NVIDIA drivers
if ubuntu-drivers devices | grep -q "nvidia"; then
    sudo ubuntu-drivers autoinstall -y
else
    # Check for available upgrades for AMD drivers
    sudo apt update
    sudo apt list --upgradable
    # Insert commands to install AMD drivers if needed
    # (Please add appropriate commands to install AMD drivers here)
fi
