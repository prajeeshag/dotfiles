#!/bin/bash
LINE='[ -e ~/.shellrc ] && source ~/.shellrc'

for rc in .zshrc .bashrc; do
  if [ -e ~/$rc ]; then
    echo "Adding ~/.shellrc to ~/.zshrc"
    grep -qxF "$LINE" ~/$rc || echo "$LINE" >> ~/$rc
  fi
done

