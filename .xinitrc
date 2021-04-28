#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    # shellcheck source=/dev/null
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

VENDOR="$(cat /sys/class/dmi/id/sys_vendor)"

session=${1:-plasma}

case $session in 
  plasma|kde    ) exec startplasma-x11;;
  i3|i3wm       ) dunst &
                  lxsession & 
                  ~/.fehbg &
                  picom &
                  if [ "$VENDOR" = "LENOVO" ]; then
                      setxkbmap -layout gb ;
                      exec i3 ;
                  elif [ "$VENDOR" = "Apple Inc." ]; then
                      setxkbmap -layout gb -model macbook79 ;
                      $HOME/bin/macfnmode fn ; 
                      exec i3 -c "$HOME"/.config/i3/config.mac ;
                  fi ;;
  enlightenment ) exec enlightenment_start;;
  awesome       ) exec awesome;;
  dwm           ) lxsession &
                  ~/.fehbg & #nitrogen --restore &
                  picom &
                  dwmblocks &
                  xbindkeys
                  exec dwm;;
  *             ) echo "$1"; 
                  exec "$1";;
esac

