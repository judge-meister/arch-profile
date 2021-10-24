#!/bin/bash

# install the list of packages in pkglist.txt
# shellcheck disable=SC2046

sudo pacman -S xorg $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))

