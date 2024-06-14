#!/bin/bash


if [ "$SHELL" == "/bin/zsh" ]; then
  # if oh-my-zsh is installed
  if grep -Fq 'source $ZSH/oh-my-zsh.sh' ~/.zshrc; then
   line='plugins+=(vi-mode)'
   zsh -c '. ~/.zshrc; echo $plugins' | \
     grep -Fq 'vi-mode'  || \
     sed -i -e "s|source \$ZSH/oh-my-zsh.sh|$line\n&|" ~/.zshrc
  else
    line='bindkey -v'
    grep -Fq "$line" ~/.zshrc || echo "$line" >> ~/.zshrc
  fi
else

  echo "set_vimode not implemented for $SHELL"

fi

