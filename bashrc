# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup nice colors
alias sudo='sudo '
alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '
