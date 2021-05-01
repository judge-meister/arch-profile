# arch-profile

Files from my archlinux install. I have a choice of either i3-gaps, sway or dwm as a window manager.

## Goals and Issues So Far

I'm trying to make these config/dotfiles compatible between my thinkpad and old macbookpro from 2009. This has its difficulties, in particular the keyboard support on the mac can be a little spotty.  The media keys seem to only be partially recognised, volume and screen brightness keys do not seem to register any XF86 key events.  As a result I've had to switch to using the Fn keys instead, which is fine as I generally don't use the Fn keys for anything else.

## Still To Do

* get mac touchpad to accept tap to click. - Done
* figure out right-click and middle-click behaviour for mac touchpad. - Done
* change install method so repo does not reside at root of users home directory. - Done
  * this would allow variant installations dependent on hardware.
  * also simplifies .gitignore - no need to ignore all the other random stuff in home dir.
* create a list of installed packages for reproducability.
* clean up the i3/config to stuff I actually use, and remove stuff I've copied from other people.
* figure out the touchpad thing for both sway and dwm.
* look into a login manager (light-weight of course), either text based or maybe SLiM.
  * or make my login script (wm chooser) prettier.
