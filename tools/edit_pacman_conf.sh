#!/bin/bash


if ! grep -q ILoveCandy /etc/pacman.conf
then
  echo "add ILoveCandy"
  [ ! -f /etc/pacman.conf.bak ] && sudo cp /etc/pacman.conf /etc/pacman.conf.bak
  sed 's/\(ParallelDownloads = .*$\)/\1\nILoveCandy/g' /etc/pacman.conf | sudo tee /etc/pacman.conf > /dev/null
fi

if ! grep -q "^ParallelDownloads" /etc/pacman.conf
then
  echo "enable ParallelDownloads"
  [ ! -f /etc/pacman.conf.bak ] && sudo cp /etc/pacman.conf /etc/pacman.conf.bak
  sed 's/^#ParallelDownloads = /ParallelDownloads = /' /etc/pacman.conf | sudo tee /etc/pacman.conf > /dev/null
fi


