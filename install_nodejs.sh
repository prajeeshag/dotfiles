#!/bin/bash

set -e

wget install-node.now.sh/lts -O install_node_lts.sh

bash install_node_lts.sh -P "$HOME"/.local/nodejs

rm -f install_node_lts.sh

dirnm="$HOME/.local/nodejs/bin"
strng="export PATH=$dirnm:\$PATH # nodejs_paths"
sed -i.bak '/nodejs_path/d' "$HOME/.bashrc"
echo "$strng" >> "$HOME/.bashrc"
