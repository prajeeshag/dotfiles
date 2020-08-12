#!/bin/bash

strng="source $BASEDIR/bashrc # dotfiles_appended"

if [ -f $HOME/.bashrc ]; then
  if grep -q "dotfiles_appended" $HOME/.bashrc; then
    sed -i "/dotfiles_appended/c\\$strng" $HOME/.bashrc
		echo "appended to bashrc"
  else
    echo $strng >> $HOME/.bashrc
		echo "added to bashrc"
  fi
else
  echo "No regular .bashrc file found in $HOME"
fi

