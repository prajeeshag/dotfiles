#!/bin/bash


if [ -f "$HOME/.bashrc" ]; then
	strng="source $BASEDIR/bashrc # dotfiles_appended"
		sed -i.bak '/dotfiles_appended/d' $HOME/.bashrc
    echo $strng >> $HOME/.bashrc
		echo "appended to bashrc"
	exit 0
fi

if [ -f "$HOME/.zshrc" ]; then
	strng="source $BASEDIR/zshrc # dotfiles_appended"
		sed -i.bak '/dotfiles_appended/d' $HOME/.zshrc
    echo $strng >> $HOME/.zshrc
		echo "appended to zshrc"
	exit 0
fi

echo "No regular .bashrc or .zshrc file found in $HOME"
exit 1

