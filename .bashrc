# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Set history length
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable ** globs and return empty array if it fails
shopt -s globstar nullglob

# Correct cd spelling
shopt -s cdspell autocd

# Enable globbing dotfiles
shopt -s dotglob

# Fancy prompt if not in tty
if [[ $TERM == 'linux' ]]
  then PS1='\n\[\e[96;1m\]\u@\h\[\e[0m\] \W $ '
  else PS1='\n\[\e[30;44;1m\] \u@\h\[\e[0m\]\[\e[34m\]\[\e[0m\] \W \[\e[1m\]\$\[\e[0m\] '
fi

# Set default editor
export EDITOR='nano'

# Run fastfetch with fancy logo in kitty and with text logo in other terminals
if [[ $TERM == 'xterm-kitty' ]]
  then fastfetch
  else fastfetch --logo ~/.config/fastfetch/logo.txt --logo-color-1 1
fi

# Aliases

alias ls='eza --icons --hyperlink --no-quotes'
alias la='eza --icons --hyperlink --no-quotes --all'
alias ll="eza --icons --hyperlink --no-quotes --all --long --group --smart-group --time-style '+%Y-%m-%d %H:%M'"
alias cat='bat'

alias gnu-ls='"$(which ls)" --color=auto'
alias gnu-la='"$(which ls)" -A'
alias gnu-ll='"$(which ls)" -alF'
alias gnu-cat='"$(which cat)"'

alias grep='grep --color=auto'
alias reset='reset && . ~/.bashrc'
alias neofetch='fastfetch'
alias nc='ncat'
alias netcat='ncat'
