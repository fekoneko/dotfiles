#
# ~/.bashrc
#

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
if [[ "$TERM" == "linux" ]]
  then PS1='[\u@\h \W]$ '
  else PS1='\n\[\e[30;44;1m\] \u@\h\[\e[0m\]\[\e[34m\]\[\e[0m\] \W \[\e[1m\]\$\[\e[0m\] '
fi

# Run fastfetch if in kitty
[[ "$TERM" == "xterm-kitty" ]] && fastfetch

# Run fastfetch with default config if in tty
[[ "$TERM" == "linux" ]] && fastfetch --config ''

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias neofetch='fastfetch'
