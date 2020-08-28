#!/bin/bash

set -e

TMUX_VERSION=2.4
LIBEVENT_VERSION=2.0.22-stable
NCURSES_VERSION=6.0

cdir=$(pwd)
builddir="$cdir/tmuxBuild"
installdir="$HOME/.local"

mkdir -p "$installdir"
mkdir -p "$builddir"

cd "$builddir"
wget -N https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION/libevent-$LIBEVENT_VERSION.tar.gz
tar -xzf libevent-$LIBEVENT_VERSION.tar.gz
cd libevent-$LIBEVENT_VERSION
./configure --prefix="$installdir"
make install

cd "$builddir"
wget -N https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz
tar -xzf ncurses-$NCURSES_VERSION.tar.gz
cd ncurses-$NCURSES_VERSION
./configure CPPFLAGS="-P" --prefix="$installdir"
make install

cd "$builddir"
wget -N https://github.com/tmux/tmux/releases/download/$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz
tar -xzf tmux-$TMUX_VERSION.tar.gz
cd tmux-$TMUX_VERSION
#CFLAGS="-I"$installdir"/include" LDFLAGS="-static -L"$installdir"/lib" ./configure --prefix="$installdir"
CFLAGS="-I$installdir/include" LDFLAGS="-L$installdir/lib" ./configure --prefix="$installdir"
make install

strng="export PATH=$installdir/bin:\$PATH  # tmux_install_path" >> "$HOME/.bashrc"
sed -i.bak '/tmux_install_path/d' "$HOME/.bashrc"
echo "$strng" >> "$HOME/.bashrc"
echo "appended to bashrc"

rm -rf "$builddir"
