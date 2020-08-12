#!/bin/bash


if [ -f "$HOME/.bashrc" ]; then
	strng="source $BASEDIR/bashrc # dotfiles_appended"
  if grep -q "dotfiles_appended" $HOME/.bashrc; then
		sed -i.bak '/dotfiles_appended/d' $HOME/.bashrc
    echo $strng >> $HOME/.bashrc
		echo "appended to bashrc"
  fi
fi

if [ -f "$HOME/.zshrc" ]; then
	strng="source $BASEDIR/zshrc # dotfiles_appended"
  if grep -q "dotfiles_appended" $HOME/.zshrc; then
		sed -i.bak '/dotfiles_appended/d' $HOME/.zshrc
    echo $strng >> $HOME/.zshrc
		echo "appended to zshrc"
  fi
	exit 0
fi

echo "No regular .bashrc or .zshrc file found in $HOME"
exit 1

