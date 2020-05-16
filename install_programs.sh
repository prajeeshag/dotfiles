#!/usr/bin/env bash

if [[ `uname` == 'Darwin' ]]; then
	type brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew update
	brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
	brew install gs
fi

type fzf &> /dev/null || (brew install fzf && $(brew --prefix)/opt/fzf/install)
( ( type stack &> /dev/null || (curl -sSL https://get.haskellstack.org/ | sh) ) \
	&& (type shellcheck &> /dev/null || stack install ShellCheck) ) && echo "Installation of stack or shellcheck failed!!"
