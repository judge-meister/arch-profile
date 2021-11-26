#!/bin/bash
set -x

VENDOR="$(cat /sys/class/dmi/id/sys_vendor)"
PRODUCT="$(cat /sys/class/dmi/id/product_name)"



if [ "$PRODUCT" == "ThinkPad X230" ]; #if [ "$VENDOR" == "LENOVO" ]; 
then
    setxkbmap -layout gb ;
    ~/.fehbg & 
    #nitrogen --restore &
 
elif [ "$PRODUCT" == "MacBookPro5,5" ]; #elif [ "$VENDOR" == "Apple Inc." ];
then
    setxkbmap -layout gb -model macbook79 ;
    ~/.fehbg & 
    "$HOME"/bin/macfnmode media ;
fi ;

lxsession &
picom -CGb
dwmblocks &

# current config breaks F1 F2 f5 F6 F10 F11 F12 in order to get MacBook controls to sort of work
# need to find another way, may be vendor specific config files
xbindkeys &

