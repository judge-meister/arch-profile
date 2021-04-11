#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.bash_aliases

PS1='[\u@\h \W]\$ '

# set prompt (1 for bold, 0 for normal)
. ~/bin/command_prompt.sh 1
