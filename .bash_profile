#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=~/bin:~/.local/bin:$PATH

#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startgui
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec tbsm
	
#exec startx -- vt1

