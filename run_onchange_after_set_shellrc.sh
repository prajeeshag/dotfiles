#!/bin/bash
# Set options in the shell rc files `.zshrc` and `.bashrc`

add_line() {
    local line="$1"
    local file="$2"
    grep -Fq "$line" $2 || echo "$line" >> $file
}

configure_ohmyzsh_plugin() {
    local plugin="$1"
    local rc_file=~/.zshrc
    local line="plugins+=($plugin)"
    zsh -c ". $rc_file; echo \$plugins" | grep -qF "$plugin" || \
        sed -i -e "s|source \$ZSH/oh-my-zsh.sh|$line\n&|" $rc_file
}


LINE='[ -e ~/.shellrc ] && source ~/.shellrc'
for rc in .zshrc .bashrc; do
  if [ -e ~/$rc ]; then
    echo "Adding ~/.shellrc to ~/.zshrc"
    add_line "$LINE" ~/$rc
  fi
done


# set vi-mode, git plugins
if [ "$SHELL" == "/bin/zsh" ]; then
  # if oh-my-zsh is installed
  if grep -qF 'source $ZSH/oh-my-zsh.sh' ~/.zshrc; then
    configure_ohmyzsh_plugin "vi-mode"
    configure_ohmyzsh_plugin "git"
  else
    line='bindkey -v'
    add_line "$line" ~/.zshrc
  fi
elif [ "$SHELL" == "/bin/bash" ]; then
  line='set -o vi'
  add_line "$line" ~/.bashrc
  echo "Warning: setting up git plugin not implemented for $SHELL "
fi


