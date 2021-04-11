# Command Prompt
#
# use param 0 or blank for normal colours
# use param 1 for bold colours
#

# colours

BLACK='\e[0;30m'
DARKRED='\e[0;31m'
DARKGREEN='\e[0;32m'
BROWN='\e[0;33m'
DARKBLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
LIGHTGREY='\e[0;37m'

DARKGREY='\e[01;30m'
RED='\e[01;31m'
GREEN='\e[01;32m'
YELLOW='\e[01;33m'
BLUE='\e[01;34m'
PINK=='\e[01;35m'
LIGHTCYAN='\e[01;36m'
WHITE=='\e[01;37m'

NOCOL='\e[00m'

# command_prompt

# darkred time and date
_0_d="\[${DARKRED}\]\d \t "
_1_d="\[${RED}\]\d \t "

# brown [ darkgreen user@host
_0_u_h="\[${BROWN}\][\[${DARKGREEN}\]\u\[${DARKGREEN}\]@\[${NOCOL}\]\[${DARKGREEN}\]\h\[${NOCOL}\]"
_1_u_h="\[${YELLOW}\][\[${GREEN}\]\u\[${GREEN}\]@\[${NOCOL}\]\[${GREEN}\]\h\[${NOCOL}\]"

#  cyan working dir  
_0_w=" \[${CYAN}\]\w\[${NOCOL}\]"
_1_w=" \[${BLUE}\]\w\[${NOCOL}\]"

# gitps1 brown ]  
_0_g2="\[${BROWN}\]]"
_1_g2="\[${YELLOW}\]]"

# newline brown [command number]
_0_nl="\n\[${BROWN}\][\!]\[${NOCOL}\]"
_1_nl="\n\[${YELLOW}\][\!]\[${NOCOL}\]"

# add final $
__end=" \$ "

# Mercurial Functions
hg_ps1()
{
    hg identify -b 2> /dev/null | sed -E s/^\(.+\)$/\ \(\\1\)/
}
hg_dirty() {
    hg status 2> /dev/null \
    | awk '$1 == "?" { print " untracked" } $1 != "?" { print " modified" }' \
    | sort | uniq | head -1
}
hg_in_repo() {
    [[ `hg branch 2> /dev/null` ]] && echo '[hg]'
}
function parse_git_remote {
  echo -n $(git status 2>/dev/null | awk -v out=$1 '/# Your branch is / { if(out=="") print $5; else print out }')
}
# Git functions
git_ps1()
{
    git branch 2> /dev/null | sed -E s/^\\*\ \(.+\)$/\ \(\\1\)/
}
function git_dirty {
  echo -n ' '$(git status 2>/dev/null | awk -v out=$1 -v std="dirty" '{ if ($0=="# Changes to be committed:") std = "uncommited"; last=$0 } END{ if(last!="" && last!="nothing to commit (working directory clean)") { if(out!="") print out; else print std } }')
}
git_in_repo() {
    [[ `git branch 2> /dev/null` ]] && echo ' [git]'
}
function git_remote {
  echo -n $(git status 2>/dev/null | awk -v out=$1 '/# Your branch is / { if(out=="") print "("$4")"; else print out }')
}


#PS1=$__d$__u_h$__w'$(git_in_repo)$(git_ps1)$(git_dirty)$(git_remote)$(hg_in_repo)$(hg_ps1)$(hg_dirty)'$__g2$__nl$__end

PS1=$_0_d$_0_u_h$_0_w$_0_g2$_0_nl$__end

if [ $1 -eq 1 ]
then
  PS1=$_1_d$_1_u_h$_1_w$_1_g2$_1_nl$__end
fi

