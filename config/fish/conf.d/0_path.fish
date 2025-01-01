# This file is loaded first, and it makes sure the $PATH is set up,
# in case other conf.d files need to use those programs

eval "$(/opt/homebrew/bin/brew shellenv)"

# Add ~/bin to path
# This is a folder where I put custom helper scripts
# Most of them are stored in my dotfiles git repo and synced there by rcm
fish_add_path --path "$HOME/bin"
