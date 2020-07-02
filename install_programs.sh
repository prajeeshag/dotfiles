#!/usr/bin/env bash

if [[ $(uname) == 'Darwin' ]]
then

  # Install homebrew
	type brew &> /dev/null || /bin/bash -c \
		"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

	#GNU utilities
	type gls &> /dev/null || brew install coreutils findutils \
		gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

  #Ghost Script
  type gs &> /dev/null ||	brew install gs

	#fzf
	type fzf &> /dev/null || (brew install fzf && "$(brew --prefix)"/opt/fzf/install)

	#ShellCheck
	type shellcheck &> /dev/null || brew install shellcheck

	#shfmt
	type shfmt &> /dev/null || brew install shfmt
  
	#mosh
	type mosh &> /dev/null || brew install mosh

fi

type conda &> /dev/null || (echo "Install miniconda and rerun the script"; exit 1)

#fortls
type fortls &> /dev/null || pip install fortran-language-server

