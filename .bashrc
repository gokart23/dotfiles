#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# added by karthik - GOPATH setup
export GOPATH="~/go"
export PATH="$PATH:$GOPATH/bin"

# added by Miniconda3 installer
export PATH="/home/sduddu/Software/miniconda/installed/bin:$PATH"
