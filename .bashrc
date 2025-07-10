# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history length
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Fancy prompt if not in tty
if [[ $TERM == 'linux' ]]
  then PS1='\n\[\e[96;1m\]\u@\h\[\e[0m\] \W $ '
  else PS1='\n\[\e[30;44;1m\] \u@\h\[\e[0m\]\[\e[34m\]\[\e[0m\] \W \[\e[1m\]\$\[\e[0m\] '
fi

# Set default editor
export EDITOR='nano'

# Initialize NVM
# shellcheck source=/dev/null
. /usr/share/nvm/init-nvm.sh

# Run fastfetch with fancy logo in kitty and with text logo in other terminals
if [[ $TERM == 'xterm-kitty' ]]
  then fastfetch
  else fastfetch --logo ~/.config/fastfetch/logo.txt --logo-color-1 1
fi

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reset='reset && . ~/.bashrc'
alias neofetch='fastfetch'
