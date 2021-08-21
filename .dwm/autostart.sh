#!/bin/bash
set -x

VENDOR="$(cat /sys/class/dmi/id/sys_vendor)"


if [ "$VENDOR" == "LENOVO" ]; 
then
    setxkbmap -layout gb ;
    ~/.fehbg & 
    #nitrogen --restore &
elif [ "$VENDOR" == "Apple Inc." ]; 
then
    setxkbmap -layout gb -model macbook79 ;
    "$HOME"/bin/macfnmode fn ;
fi ;

lxsession &
picom &
dwmblocks &
xbindkeys

