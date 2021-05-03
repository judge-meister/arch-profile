#!/bin/bash

lxsession &
~/.fehbg & #nitrogen --restore &
picom &
if [ "$VENDOR" = "LENOVO" ]; then
    setxkbmap -layout gb ;
elif [ "$VENDOR" = "Apple Inc." ]; then
    setxkbmap -layout gb -model macbook79 ;
    "$HOME"/bin/macfnmode fn ;
fi ;
dwmblocks &
xbindkeys

