#!/bin/bash

# install the list of packages in yay_pkglist.txt using yay
# shellcheck disable=SC2046

#sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))

yay -S $(comm -12 <(yay -Sql | sort) <(sort yay_pkglist.txt | grep -v '^#' | awk -F' ' '{print $1}') )

