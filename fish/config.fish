if status is-interactive
    # Commands to run in interactive sessions can go here
end

# load Starship
starship init fish | source

# load zoxide
zoxide init fish | source


# alias
alias cls="clear"
alias nv="nvim"


# functions
function rehash_config
	source ~/.config/fish/config.fish
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Final
tmux -f ~/.config/tmux/.tmux.conf
