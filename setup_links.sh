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

#Setup oh-my-zsh
# 	Download from git if not present as oh-my-zsh is a part of .gitignore of this project
if [ -f oh-my-zsh ] ; then
	git clone https://github.com/robbyrussell/oh-my-zsh
fi
#	Setup links
if [ -f $HOME/.oh-my-zsh -o -L $HOME/.oh-my-zsh ] ; then
	echo "Removing old oh-my-zsh folder"
	rm -rf $HOME/.oh-my-zsh
fi
echo "Adding symlink to oh-my-zsh folder"
ln -s `pwd`/oh-my-zsh $HOME/.oh-my-zsh

#Setup zsh
if [ -f $HOME/.zshrc -o -L $HOME/.zshrc ] ; then
	echo "Removing old zshrc"
	rm -rf $HOME/.zshrc
fi
echo "Adding symlink to zshrc"
ln -s `pwd`/.zshrc $HOME/.zshrc
