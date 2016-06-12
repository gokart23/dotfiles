#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# added by karthik - GOPATH setup
export GOPATH="/home/karthik/go"
export PATH="$PATH:$GOPATH/bin"
# added by Anaconda2 4.0.0 installer
export PATH="/home/karthik/Programs/anaconda2/bin:$PATH"

