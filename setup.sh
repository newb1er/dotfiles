#!/bin/bash

if [[ $UID != 0 ]]; then
	echo "Please run this script with sudo:"
	echo "sudo $0 $*"
	exit 1
fi

apt_prog_installed() {
	LINE=$(apt list --installed "$1" 2>/dev/null | grep "$1" | wc -l)
	if [ $LINE -eq 0 ]; then
		return 1
	else
		return 0
	fi
}

# install fish
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	INSTALLED=$(apt_prog_installed "fish")
	if [ "$INSTALLED" = 0 ]; then
		echo "Installing ${PROGRAM}..."
		apt install ${PROGRAM} -y
	fi
fi

# install tmux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	INSTALLED=$(apt_prog_installed "tmux")
	if [ "$INSTALLED" = 0 ]; then
		echo "Installing ${PROGRAM}..."
		apt install ${PROGRAM} -y
	fi
fi

# install Fisher
# NOTE: check whether fisher.fish completions existed.
## 		'fisher' command is not available in bash
FILE='$HOME/.config/fish/completions/fisher.fish'
if [ -f "$FILE" ]; then
	echo 'Installing fisher...'
	fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fi

# install Starship
starship 2>/dev/null
if [ $? -eq 127 ]; then
	echo 'Installing starship...'
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# install neovim
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	INSTALLED=$(apt_prog_installed "neovim")
	if [ "$INSTALLED" = 0 ]; then
		echo "Installing ${PROGRAM}..."
		apt install ${PROGRAM}
	fi
fi

# install vim-plug
FILE="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -f $FILE ]; then
	echo 'Installing vim-plug...'
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
