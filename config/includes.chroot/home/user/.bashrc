###########
# History #
###########
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s cdspell
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE="jrnl *"
###############
# Winsize fix #
###############
shopt -s checkwinsize
###########
# Prompts #
###########
color_prompt=yes
RED="$(tput setaf 1)"
BRED="$(tput bold; tput setaf 1)"
RESET="$(tput sgr0)"
BLUE="$(tput setaf 4)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
CYAN="$(tput setaf 6)"
PURPLE="$(tput setaf 5)"
TIME="$(date +%H:%M:%S)"
if [ -n "$SSH_CLIENT" ];
    then SES="$(tput setaf 3)@$(tput setaf 5)$(hostname)";
fi
if [ $(whoami) == root ];
    then NAME="$(tput blink)$(tput setaf 1)groot$(tput sgr0)";
    else NAME="$(tput setaf 4)$(whoami)";
fi
PS1='\[$BRED\]┌[\[$RESET\]\[$CYAN\]\D{%T}\[$BRED\]]\[$RESET\]\[$BRED\][\[$RESET\]$NAME\[$YELLOW\]$SES\[$BRED\]][\[$RESET\]\[$CYAN\]\w\[$BRED\]]\[$RESET\]\[$YELLOW\]${?#0}\[$RESET\]\n\[$BRED\]┕\[$RESET\] '
#######################
# Colorize + Humanize #
#######################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -h -p --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
###########
# Aliases #
###########
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias chntpw='sudo chntpw'

#########
# Other #
#########
# vi mode
set -o vi
# Exports
export VISUAL=vim
export EDITOR="$VISUAL"
# Path
export PATH=$PATH:/usr/sbin