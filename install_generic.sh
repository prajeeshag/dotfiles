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

#Libevent
if [ -z $(ls "$installdir/lib/libevent.a" 2> /dev/null) ]; then
	echo "Installing libevent........."
	cd "$builddir"
	wget -c https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION/libevent-$LIBEVENT_VERSION.tar.gz
	tar -xzf libevent-$LIBEVENT_VERSION.tar.gz
	cd libevent-$LIBEVENT_VERSION
	./configure --prefix="$installdir"
	make install -j
fi


#NCURSES
if [ -z $(ls "$installdir/lib/libncurses.a" 2> /dev/null) ]; then
	echo "Installing libncurses........."
	cd "$builddir"
	wget -c https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz
	tar -xzf ncurses-$NCURSES_VERSION.tar.gz
	cd ncurses-$NCURSES_VERSION
	./configure CPPFLAGS="-P" --prefix="$installdir" CXXFLAGS="-fPIC" CFLAGS="-fPIC"
	make install -j
fi


#TMUX
if ! command -v tmux &> /dev/null; then
	echo "Installing tmux........."
	cd "$builddir"
	wget -c https://github.com/tmux/tmux/releases/download/$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz
	tar -xzf tmux-$TMUX_VERSION.tar.gz
	cd tmux-$TMUX_VERSION
	CFLAGS="-I$installdir/include" LDFLAGS="-L$installdir/lib" ./configure --prefix="$installdir"
	make install -j 
fi


#ZSH
#if ! command -v zsh &> /dev/null; then
if [ -z $(ls "$installdir/bin/zsh" 2> /dev/null) ]; then
	echo "Installing zsh........."
	cd "$builddir"
	wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
	tar xf zsh.tar.xz
	cd zsh-*
	./configure --prefix="$installdir" \
		    CPPFLAGS="-I$installdir/include" \
				    LDFLAGS="-L$installdir/lib"
	make -j && make install
else
	echo "ZSH already installed"
	command -v zsh
fi

strng="export LD_LIBRARY_PATH=$installdir/lib:\$LD_LIBRARY_PATH; export PATH=$installdir/bin:\$PATH  # tmux_install_path"
sed -i.bak '/tmux_install_path/d' "$HOME/.bashrc"
echo "$strng" >> "$HOME/.bashrc"
echo "appended to bashrc"

rm -rf "$builddir"

#FZF
if ! command -v fzf &> /dev/null; then
	echo "Installing FzF...."	
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
	$HOME/.fzf/install
fi
