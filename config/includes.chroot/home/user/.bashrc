# ~/.bashrc: executed by bash(1) for non-login shells.  

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;; esac
export TERM=xterm 
set -o vi

########
# Path #
########
export PATH=$PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/sbin:/usr/sbin:/snap/bin:~/bin

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

# Prompts come from the alt files that can be chain loaded with `source`

#######################
# Colorize + Humanize #
#######################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -h --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#################
# Auto Complete #
#################
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#########
# Title #
#########

# This will run before any command is executed.
function PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT

  # Do stuff.
  trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG
}
trap "PreCommand" DEBUG

# This will run after the execution of the previous full command line.  We don't
# want it PostCommand to execute when first starting a bash session (i.e., at
# the first prompt).
FIRST_PROMPT=1
function PostCommand() {
  AT_PROMPT=1

  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi

  # Do stuff.
  #echo "Return"
}
PROMPT_COMMAND="PostCommand"

##############
# Source RVM #
##############
#source /etc/profile.d/rvm.sh

###########
# Aliases #
###########
alias r='source ~/.bashrc'
alias pub='curl -s ipinfo.io/ip'
alias x='startx'
alias iptables-list='sudo iptables -L -n --line-numbers'
alias rm='rm -i'
alias clean-comments="grep -o '^[^#]*'"
alias dex='docker exec -it $1 /bin/bash'
alias share="fc -s > /tmp/share ; curl -T /tmp/share -H 'Linx-Expiry: 600' -H 'Linx-Randomize: yes' https://share.dev0.sh/upload/ ; rm -f /tmp/share"
alias git-update="for d in */; do cd "$d" ; git pull origin master ; cd .. ;done"

# Docker
alias docker-stats='docker ps --format "table {{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'
alias docker-update='docker-compose down && docker-compose pull && docker-compose up -d --build'

# bash env
alias upbash='curl -s -L -k https://git.dev0.sh/piper/rcs/raw/branch/master/bashrc > ~/.bashrc && curl -s -L -k https://git.dev0.sh/piper/rcs/raw/branch/master/bashrcPromptSimple > ~/.bashrcPromptSimple && curl -s -L -k https://git.dev0.sh/piper/rcs/raw/branch/master/bashrcPromptComplex > ~/.bashrcPromptComplex && curl -s -L -k https://git.dev0.sh/piper/rcs/raw/branch/master/bashrcPromptPowerline > ~/.bashrcPromptPowerline && source ~/.bashrc'
alias getvim='curl -s -L -k https://git.dev0.sh/piper/rcs/raw/branch/master/vimrc > ~/.vimrc ; mkdir ~/.bak'
alias upvim='curl -s -L -k https://git.dev0.sh/piper/rcs/raw/branch/master/vimrc > ~/.vimrc'
alias getgit='curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh && source ~/.bashrc'
alias simple='source .bashrcPromptSimple'
alias complex='source .bashrcPromptComplex'

# Sudo Fixes
alias apt='sudo apt'
alias dpkg='sudo dpkg'
alias eopkg='sudo eopkg'
alias yum='sudo yum'
alias pacman='sudo pacman'
alias zypper='sudo zypper'

#Functions
function wttr { 
	curl wttr.in/"$1"; 
}
function speed { 
	curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -; 
}
function git-setup {
	gpg --list-secret-keys --keyid-format LONG
	echo 'git-setup "name" "email" "ssb"'
	git config --local user.name "$1"
	git config --local user.email "$2"
	git config --local user.signingkey "$3"
	git config --local tag.forceSignAnnotated true
	git config --local push.gpgsign if-asked
	git config --global commit.gpgsign true
}

# Exports
export -f wttr
export PATH="$PATH:$HOME/.rvm/"
export -f speed
export VISUAL=vim
export EDITOR="$VISUAL"

# Commands
#echo -e "Hi, I am $(hostname). I am working with $(free -h | sed -n '2p' | awk '{print $4}') out of $(free -h | sed -n '2p' | awk '{print $2}') of RAM. I have been $(uptime -p). I can be found here $(ip route | sed -n '1p' | awk '{print $3}') and $(pub)."
source ~/.bashrcPromptComplex
