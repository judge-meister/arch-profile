#!/bin/bash

# script to install yay

cd /opt || exit
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R judge:judge /opt/yay
cd yay || exit
makepkg -si

