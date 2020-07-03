#!/bin/bash

set -e

TMUX_VERSION=2.4
LIBEVENT_VERSION=2.0.22-stable
NCURSES_VERSION=6.0

mkdir -p $HOME/.local
mkdir -p $HOME/src

#cd $HOME/src
#wget -N https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION/libevent-$LIBEVENT_VERSION.tar.gz
#tar -xzf libevent-$LIBEVENT_VERSION.tar.gz
#cd libevent-$LIBEVENT_VERSION
#./configure --prefix=$HOME/.local
#make install
#
#cd $HOME/src
#wget -N https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz
#tar -xzf ncurses-$NCURSES_VERSION.tar.gz
#cd ncurses-$NCURSES_VERSION
#./configure CPPFLAGS="-P" --prefix=$HOME/.local
#make install

cd $HOME/src
#wget -N https://github.com/tmux/tmux/releases/download/$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz
#tar -xzf tmux-$TMUX_VERSION.tar.gz
cd tmux-$TMUX_VERSION
#CFLAGS="-I$HOME/.local/include" LDFLAGS="-static -L$HOME/.local/lib" ./configure --prefix=$HOME/.local
CFLAGS="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib" ./configure --prefix=$HOME/.local
make install


