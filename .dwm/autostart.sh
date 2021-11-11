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
picom -CGb
dwmblocks &

# current config breaks F1 F2 f5 F6 F10 F11 F12 in order to get MacBook controls to sort of work
# need to find another way, may be vendor specific config files
xbindkeys

