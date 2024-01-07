#!/bin/bash

# Resolve the desktop applet issue
sudo touch /etc/network/interfaces
sudo sh -c 'echo "auto lo" >> /etc/network/interfaces'
sudo sh -c 'echo "iface lo inet loopback" >> /etc/network/interfaces'
sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/network.yaml
sudo rm /etc/netplan/00-installer-config.yaml
sudo sh -c 'echo "  renderer: NetworkManager" >> /etc/netplan/network.yaml'
sudo netplan apply
