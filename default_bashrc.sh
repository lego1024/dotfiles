#!/usr/bin/env bash


# code couleur
export BLACK='\e[30m'
export RED='\e[31m'
export GREEN='\e[32m'
export YELLOW='\e[33m'
export BLUE='\e[34m'
export MAGENTA='\e[35m'
export CYAN='\e[36m'
export LIGHT_GRAY='\e[37m'
export DARK_GRAY='\e[90m'
export LIGHT_RED='\e[91m'
export LIGHT_GREEN='\e[92m'
export LIGHT_YELLOW='\e[93m'
export LIGHT_BLUE='\e[94m'
export LIGHT_MAGENTA='\e[95m'
export LIGHT_CYAN='\e[96m'
export WHITE='\e[97m'


##
alias reload_bashrc="source ~/.bashrc"

## pseudo tree command
alias tree="find . -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'"


## git
alias gs="git status"

fast_git_ps1 ()
{
    printf -- "$(git branch 2>/dev/null | sed -ne '/^\* / s/^\* \(.*\)/ [\1] / p')"
}
#PS1='\[\033]0;$MSYSTEM:\w\007\033[32m\]\u@\h \[\033[33m\w$(fast_git_ps1)\033[0m\]$ '

# ultra fast git
PS1='\[\033[33m\w\033[0m\]\n$ '


# vim
EDITOR=vim


LANG='en-US'

explainshell() {
    echo "go to ?" "https://explainshell.com/explain?cmd=\"$*\""  
    read -p "Are you sure? [y/N]" -n 1 -r
    echo reply = $REPLY
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        "C:\Program Files\Mozilla Firefox\firefox.exe" "https://explainshell.com/explain?cmd=$*" 
    else
        echo arbored
    fi
  
 }