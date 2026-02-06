# This file is loaded first, and it makes sure the $PATH is set up,
# in case other conf.d files need to use those programs

if test Linux = (uname)
    # This space intentionally left blank
else
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# Add ~/bin to path
# This is a folder where I put custom helper scripts
# Most of them are stored in my dotfiles git repo and synced there by rcm
fish_add_path --path "$HOME/bin"

# Claude Code puts its bin here
fish_add_path --path "$HOME/.local/bin"
