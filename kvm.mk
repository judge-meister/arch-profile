# make file for kvm installs
# vim: noet

SHELL := bash

.PHONY: etc
etc: cleanetc
	sudo ln -snfv $(CURDIR)/etc/X11/xorg.conf.d/20-monitor.conf /etc/X11/xorg.conf.d/    

.PHONY: cleanetc
cleanetc:
	sudo rm -f /etc/X11/xorg.conf.d/20-monitor.conf

