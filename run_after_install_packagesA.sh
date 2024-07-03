#!/bin/bash

set -e

add_line() {
	local line="$1"
	local file="$2"
	if [ -e "$file" ]; then
		grep -Fq "$line" "$file" || echo "$line" >>"$file"
	fi
}

add_to_shellrc() {
	LINE="$1"
	for rc in ~/.zshrc ~/.bashrc; do
		add_line "$LINE" "$rc"
	done
}

set_ohmyzsh_plugin() {
	local plugin="$1"
	local rc_file=~/.zshrc
	local line="plugins+=($plugin)"
	zsh -c ". $rc_file; echo \$plugins" | grep -qF "$plugin" ||
		sed -i -e "s|source \$ZSH/oh-my-zsh.sh|$line\n&|" $rc_file
}

version_gte() {
	version1=$1
	version2=$2

	if [ "$version1" = "$version2" ]; then
		return 0 # versions are equal
	elif [ "$(printf '%s\n' "$version1" "$version2" | sort -V | head -n 1)" = "$version1" ]; then
		return 1 # version1 is less than version2
	else
		return 0 # version1 is greater than version2
	fi
}

get_libc_version() {
	ldd --version | head -n1 | awk '{print $NF}'
}

nvim_pkg_name() {
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

command_exists() {
	if [ "$SHELL" == "/bin/zsh" ]; then
		zsh -c "source ~/.zshrc; command -v $1 &>/dev/null"
	else
		bash -c "source ~/.bashrc; command -v $1 &>/dev/null"
	fi
}

install_brew() {
	os=$(uname -s)
	[ "$os" != "Darwin" ] && return || echo ""
	pkg=brew
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_otp_cli() {
	os=$(uname -s)
	[ "$os" != "Darwin" ] && return || echo ""
	pkg="otp-cli"
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	install_brew
	brew install coreutils oath-toolkit
	mkdir -p ~/.local/
	git clone git@github.com:rfocosi/otp-cli.git ~/.local/otp-cli
	cd ~/.local/otp-cli && ln -s "$(pwd)/otp-cli" ~/.local/bin/otp-cli
	LINE='export PATH=~/.local/bin:$PATH' #ignore
	add_to_shellrc "$LINE"
}

get_nvim_version() {
	os=$(uname -s)
	if [ "$os" == "Darwin" ]; then
		echo "latest"
		return 0
	fi

	if version_gte "$(get_libc_version)" "2.31"; then
		echo "latest"
	else
		echo "v0.9.5"
	fi
}

install_nvim() {
	set -e
	pkg=nvim
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	# Install nvim
	PKG_NAME=$(nvim_pkg_name)
	TAR_FILE=${PKG_NAME}.tar.gz
	version=$(get_nvim_version)
	if [ "$version" == "latest" ]; then
		curl -LO https://github.com/neovim/neovim/releases/latest/download/"${TAR_FILE}"
	else
		curl -LO https://github.com/neovim/neovim/releases/download/${version}/"${TAR_FILE}"
	fi

	echo "$0: Neovim${version}  downloaded.."
	mkdir -p ~/.local
	rm -rf ~/.local/nvim
	tar -xzf "${TAR_FILE}"
	mv "${PKG_NAME}" ~/.local/nvim
	echo "$0: Neovim extrated.."
	LINE='export PATH=~/.local/nvim/bin:$PATH' #ignore
	add_to_shellrc "$LINE"
	echo "Neovim installation done.."
}

install_nvm() {
	pkg=nvm
	source_nvmsh
	command -v "$pkg" &>/dev/null && return || echo ""
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	url="https://api.github.com/repos/nvm-sh/nvm/releases/latest"
	LATEST_RELEASE=$(curl -s $url | grep "tag_name" | sed 's/"//g' | sed 's/,//g' | awk '{ print $2 }')
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/"$LATEST_RELEASE"/install.sh | bash
}

install_micromamba() {
	pkg=micromamba
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
	line='export PATH=$MAMBA_ROOT_PREFIX/bin:$PATH'
	add_to_shellrc "$line"
}

source_nvmsh() {
	# shellcheck source=/dev/null
	if [ -s ~/.nvm/nvm.sh ]; then
		if ! command_exists "nvm"; then
			source ~/.nvm/nvm.sh
			add_to_shellrc "source ~/.nvm/nvm.sh"
		fi
	fi
}

install_npm() {
	pkg=npm
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	source_nvmsh
	nvm install --lts
}

install_python_lsp_server() {
	pkg="pylsp"
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	micromamba activate base
	pip install -U setuptools
	pip install "python-lsp-server[all]"
	pip install python-lsp-ruff pylsp-mypy python-lsp-isort python-lsp-black
}

install_bash_language_server() {
	pkg="bash-language-server"
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	source_nvmsh
	npm i -g bash-language-server
}

__install_mambapkg() {
	micromamba install "$1" -c conda-forge -n base -y
}

install_shellcheck() {
	pkg=shellcheck
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	__install_mambapkg shellcheck
}

install_shfmt() {
	pkg=shfmt
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	curl -sS https://webi.sh/shfmt | sh
}

install_fzf() {
	pkg=fzf
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	add_line 'eval "$(fzf --bash)"' ~/.bashrc
	add_line 'source <(fzf --zsh)' ~/.zshrc
}

install_rg() {
	pkg=rg
	command_exists "$pkg" && return || echo "Installing $pkg ..."
	curl -sS https://webi.sh/rg | sh
}

__run_install() {
	# List all functions starting with install_
	install_functions=$(declare -F | awk '{print $3}' | grep '^install_')
	source_nvmsh
	for fn in $install_functions; do
		set +e
		$fn
		set -e
	done
}

__set_shell_properties() {
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

__main() {
	__run_install
	__set_shell_properties
	add_to_shellrc '[ -e ~/.shellrc ] && source ~/.shellrc'

	line='export PATH=$MAMBA_ROOT_PREFIX/bin:$PATH'
	add_to_shellrc "$line"

	line='[ -n "$SSH_CONNECTION" ] && [ -z "$TMUX" ] && tmux new-session -As0'
	add_to_shellrc "$line"
}

__main
