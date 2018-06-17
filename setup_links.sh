#!/bin/bash

#Setup xinitrc for X Window system
if [ -f $HOME/.xinitrc -o -L $HOME/.xinitrc ] ; then
	echo "Removing old xinitrc"
	rm $HOME/.xinitrc
fi
echo "Adding symlink to xinitrc"
ln -s `pwd`/.xinitrc $HOME/.xinitrc

#Setup bashrc
if [ -f $HOME/.bashrc -o -L $HOME/.bashrc ] ; then
	echo "Removing old bashrc"
	rm $HOME/.bashrc
fi
echo "Adding symlink to bashrc"
ln -s `pwd`/.bashrc $HOME/.bashrc

#Setup vim 
if [ -f $HOME/.vim -o -L $HOME/.vim ] ; then
	echo "Removing old vim folder"
	rm -rf $HOME/.vim
fi
echo "Adding symlink to .vim folder"
ln -s `pwd`/.vim $HOME/.vim
if [ -f $HOME/.vimrc -o -L $HOME/.vimrc ] ; then
	echo "Removing old vimrc"
	rm $HOME/.vimrc
fi
echo "Adding symlink to .vimrc"
ln -s `pwd`/.vimrc $HOME/.vimrc

#Setup zsh
if [ -f $HOME/.zshrc -o -L $HOME/.zshrc ] ; then
	echo "Removing old zshrc"
	rm -rf $HOME/.zshrc
fi
echo "Adding symlink to zshrc"
ln -s `pwd`/.zshrc $HOME/.zshrc

#Setup proxy script
if [ -f $HOME/set_proxy.sh -o -L $HOME/set_proxy.sh ] ; then
	echo "Removing old proxy script"
	rm -rf $HOME/set_proxy.sh
fi
echo "Adding symlink to proxy_script"
ln -s `pwd`/set_proxy.sh $HOME/set_proxy.sh

#Setup tmux conf
if [ -f $HOME/.tmux.conf -o -L $HOME/.tmux.conf ] ; then
	echo "Removing old tmux conf"
	rm -rf $HOME/.tmux.conf
fi
echo "Adding symlink to tmux conf"
ln -s `pwd`/.tmux.conf $HOME/.tmux.conf
