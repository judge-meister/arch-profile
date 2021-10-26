#!/bin/bash

# script to install yay

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R judge:judge /opt/yay
cd yay
makepkg -si

