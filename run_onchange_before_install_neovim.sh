#!/bin/bash
set -e

pkg_name(){
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


PKG_NAME=$(pkg_name)
TAR_FILE=${PKG_NAME}.tar.gz

curl -LO https://github.com/neovim/neovim/releases/latest/download/${TAR_FILE}
echo "$0: Neovim downloaded.."
mkdir -p ~/.local
rm -rf ~/.local/${PKG_NAME}
tar -C ~/.local -xzf ${TAR_FILE} && rm ${TAR_FILE}
echo "$0: Neovim extrated.."
LINE="export PATH=~/.local/${PKG_NAME}/bin:\$PATH"

[ -f ~/.zshrc ] && (grep -Fq "$LINE" ~/.zshrc || echo $LINE >> ~/.zshrc) || echo
[ -f ~/.bashrc ] && (grep -Fq "$LINE" ~/.bashrc || echo $LINE >> ~/.bashrc) || echo

echo "Neovim installation done.."

