#!/bin/bash

if [[ $UID != 0 ]]; then
	echo "Please run this script with sudo:"
	echo "sudo $0 $*"
	exit 1
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
	LINE=$(apt list --installed tmux 2>/dev/null | grep tmux | wc -l)
	if [ $LINE -le 1 ]; then
		echo 'Installing neovim...'
		apt install neovim
	fi
fi

# install vim-plug
FILE="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -f $FILE ]; then
	echo 'Installing vim-plug...'
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
