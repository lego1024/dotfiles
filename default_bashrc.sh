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

##
alias cls='echo -e "\ec\e[3J"'

## git
alias gs="git status"

fast_git_ps1 ()
{
    printf -- "$(git branch 2>/dev/null | sed -ne '/^\* / s/^\* \(.*\)/ [\1] / p')"
}
#PS1='\[\033]0;$MSYSTEM:\w\007\033[32m\]\u@\h \[\033[33m\w$(fast_git_ps1)\033[0m\]$ '

# ultra fast git
#PS1='\[\033[33m\w\033[0m\]\n$ '


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

to_cynwin_path() {
    echo $1 | sed  's/\\/\//g' | sed 's/C:/\/c/'
}


vdiff () {
    if [ "${#}" -ne 2 ] ; then
        echo "vdiff requires two arguments"
        echo "  comparing dirs:  vdiff dir_a dir_b"
        echo "  comparing files: vdiff file_a file_b"
        return 1
    fi

    local left="${1}"
    local right="${2}"

    if [ -d "${left}" ] && [ -d "${right}" ]; then
        vim +"DirDiff ${left} ${right}"
    else
        vim -d "${left}" "${right}"
    fi
}

weather () {  
  curl "https://wttr.in/$1" -k
}


function mkscript () {
    local file="${1}"

    [ -z "${file}" ] && { echo "Please supply a script name to create"; return 1; }
    [ -f "${file}" ] && { echo "${file} already exists, aborting"; return 1; }

    mkdir -p "$(dirname "${file}")"

    cat > "${file}" << EOF
#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

echo "hello world"
EOF

    chmod +x "${file}"
}


function note () { 
  yyyymmdd=$(date +%Y%m%d)
  title=""

  if [ ! -z "${1}" ]; then
    title="${yyyymmdd}_$(echo "$@" | sed 's/ /_/g')"
  fi
  
  my_new_note="~/Documents/Notes/${title}.md"
  if [ -f ${file} ]; then
    cat > "${file}" <<EOF
---
tags:
  - 
--- 
#$@
 
EOF
  fi

  vim ${file}

}

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"


function mvn_set_version() {
    if [ ! -e "pom.xml" ]; then
        echo -e "${RED}No pom.xml file found${WHITE}"
        return 2
    fi
    if [ -z "$1" ]; then
        echo -e "${RED}usage $0 <la_nouvelle_version>${white}"
        return 1
    fi   
    echo "mvn versions:set -DnewVersion=$1"
    
    
    read -p "Voulez-vous continuer ? ([Y]es/no): " confirmation
    if [[ "${confirmation}" == "yes" ]] || [[ "${confirmation}" == "Y" ]] || [[ -z "${confirmation}" ]];  then
       mvn versions:set -DnewVersion=$1
    fi   
}
