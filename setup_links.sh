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
