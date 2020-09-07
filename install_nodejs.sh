
set -e

wget -c https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-x64.tar.xz -O node.tar.xz
mkdir -p nodejs && tar xf node.tar.xz -C nodejs --strip-components 1
mkdir -p "$HOME/.local"
mv nodejs "$HOME/.local"
dirnm="$HOME/.local/nodejs/bin"
strng="export PATH=$dirnm:\$PATH # nodejs_paths"
sed -i.bak '/nodejs_path/d' "$HOME/.bashrc"
echo $strng >> "$HOME/.bashrc"
