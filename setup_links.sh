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

#Setup gitconfig
if [ -f $HOME/.gitconfig -o -L $HOME/.gitconfig ]; then
    echo "Removing old .gitconfig"
    rm -f $HOME/.gitconfig
fi
ln -s `pwd`/.gitconfig $HOME/.gitconfig

#Setup vim 
if [ -f $HOME/.vim -o -L $HOME/.vim ] ; then
	echo "Removing old vim folder"
	rm -rf $HOME/.vim
fi
echo "Adding symlink to .vim folder"
ln -s `pwd`/.vim $HOME/.vim
pushd $HOME/.vim
    git submodule init
    git pull --recurse-submodules
    echo "Downloading and installing pathogen"
    mkdir -p bundle/vim-pathogen/autoload
    if curl -LSso bundle/vim-pathogen/autoload/pathogen.vim https://tpo.pe/pathogen.vim; then
        echo "Unable to download pathogen - please install manually"
    fi
    echo "Fetching molokai colorscheme"
    mkdir colors
    if curl -LSso colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
popd

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
pushd $HOME/.zshrc
    git submodule init || true
    git pull --recurse-submodule
    ln -s pure.zsh prompt_pure_setup
    ln -s async.zsh async
popd

#Set up zsh pure theme in the fpath
PURE_THEME_DIRECTORY=".zsh/pure"
if [ ! -e "`pwd`/${PURE_THEME_DIRECTORY}/prompt_pure_setup" ]; then
    ln -s `pwd`/${PURE_THEME_DIRECTORY}/pure.zsh `pwd`/${PURE_THEME_DIRECTORY}/prompt_pure_setup
    ln -s `pwd`/${PURE_THEME_DIRECTORY}/async.zsh `pwd`/${PURE_THEME_DIRECTORY}/async
fi
#Also setup zsh related folder
if [ -d $HOME/.zsh -o -L $HOME/.zsh ]; then
    echo "Removing old .zsh directory"
    rm -rf $HOME/.zsh
fi
ln -s `pwd`/.zsh $HOME/.zsh
fpath=( "$HOME/${PURE_THEME_DIRECTORY}" $fpath )


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
