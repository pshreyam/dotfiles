#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export TERM="xterm-256color"
export TERMINAL="/usr/bin/terminator"
export EDITOR="/snap/bin/nvim"
