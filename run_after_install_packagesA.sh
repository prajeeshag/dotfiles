#!/bin/bash 
set -e

add_line() {
    local line="$1"
    local file="$2"
    grep -Fq "$line" $2 || echo "$line" >> $file
}

add_to_shellrc() {
  LINE=$1
  for rc in .zshrc .bashrc; do
    if [ -e ~/$rc ]; then
      add_line "$LINE" ~/$rc
    fi
  done
}

set_ohmyzsh_plugin() {
    local plugin="$1"
    local rc_file=~/.zshrc
    local line="plugins+=($plugin)"
    zsh -c ". $rc_file; echo \$plugins" | grep -qF "$plugin" || \
        sed -i -e "s|source \$ZSH/oh-my-zsh.sh|$line\n&|" $rc_file
}



nvim_pkg_name(){
  os=$(uname -s)
  arch=$(uname -m)
  pkg_name="nvim-"
  if [ "$os" == "Darwin" ]; then
    if [ "$arch" == "arm64" ]; then
      pkg_name="${pkg_name}macos-arm64"
    elif [ "$arch" == "x86_64" ]; then
      pkg_name="${pkg_name}macos-x86_64"
    fi 
  elif [ "$os" == "Linux" ]; then
    if [ "$arch" == "x86_64" ]; then
      pkg_name="${pkg_name}linux64"
    fi 
  fi

  if [ "$pkg_name" == "nvim-" ]; then
    echo "Neovim installation is not implemeted for $os $arch !!"
    exit 1
  fi
  echo "$pkg_name"
}

install_nvim(){
    # Install nvim
    PKG_NAME=$(nvim_pkg_name)
    TAR_FILE=${PKG_NAME}.tar.gz
    curl -LO https://github.com/neovim/neovim/releases/latest/download/${TAR_FILE}
    echo "$0: Neovim downloaded.."
    mkdir -p ~/.local
    rm -rf ~/.local/nvim
    tar -xzf ${TAR_FILE}
    mv ${PKG_NAME} ~/.local/nvim 
    echo "$0: Neovim extrated.."
    LINE='export PATH=~/.local/nvim/bin:$PATH'
    add_to_shellrc $LINE    
    echo "Neovim installation done.."
}

install_nvm(){
    url="https://api.github.com/repos/nvm-sh/nvm/releases/latest"
    LATEST_RELEASE=$(curl -s $url | grep "tag_name" | sed 's/"//g' | sed 's/,//g' | awk '{ print $2 }')
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_RELEASE/install.sh | bash
}	

install_micromamba(){
  "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
  line='export PATH=$MAMBA_ROOT_PREFIX/bin:$PATH'
  add_to_shellrc $line
}


source_nvmsh(){
  [ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh
}

install_npm(){
    source_nvmsh
    nvm install --lts
}

install_bash_language_server(){
    source_nvmsh
    npm i -g bash-language-server  
}

__install_mambapkg(){
    micromamba activate base
    micromamba install $1 -c conda-forge
}

install_shellcheck(){
    __install_mambapkg shellcheck 
}

install_shfmt(){
    curl -sS https://webi.sh/shfmt | sh
}

__run_install(){
  # List all functions starting with install_
  install_functions=$(declare -F | awk '{print $3}' | grep '^install_')
  for fn in $install_functions; do
    pkg="$(echo $fn | sed 's/^install_//')"
    cmd=${pkg//_/-}
    if ! command -v "$cmd" &> /dev/null; then
      if ! command -v "$pkg" &> /dev/null; then
        echo "Installing $pkg ..."
        set +e
        $fn
        set -e
      fi
    fi
  done
}

__set_shell_properties(){
  # set vi-mode, git plugins
  if [ "$SHELL" == "/bin/zsh" ]; then
    # if oh-my-zsh is installed
    set_ohmyzsh_plugin "vi-mode"
    set_ohmyzsh_plugin "git"
  elif [ "$SHELL" == "/bin/bash" ]; then
    line='set -o vi'
    add_line "$line" ~/.bashrc
  fi
}

__main(){
  __run_install
  __set_shell_properties
  add_to_shellrc '[ -e ~/.shellrc ] && source ~/.shellrc'
}

__main
