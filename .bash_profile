#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile

# Bob build system autocomplete for Bash
source <(bob completion)
