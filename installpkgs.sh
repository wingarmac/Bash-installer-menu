#!/bin/sh
# Install package list
for pkg in `cat installation.txt`; do sudo apt-get install -y $pkg; done
