# This file is loaded first, and it makes sure the $PATH is set up,
# in case other conf.d files need to use those programs

if not set --query --universal _fish_uname
    set --universal _fish_uname (uname)
end

switch "$_fish_uname"
    case Darwin
        # Add macOS-specific stuff to the $PATH
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # Obsidian CLI!
        # https://help.obsidian.md/cli#Troubleshooting
        fish_add_path --path /Applications/Obsidian.app/Contents/MacOS

        fish_add_path --path "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
        fish_add_path --path "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/"
        fish_add_path /opt/homebrew/opt/imagemagick-full/bin
    case Linux
        # Nothing Linux specific at the moment
end

# Add ~/.local/bin to $PATH
# This is a folder where I put custom helper scripts
# Most of them are stored in my dotfiles git repo and synced there by rcm
fish_add_path --path "$HOME/.local/bin"

# Add ~/go/bin to $PATH
# golang puts things here. Sure!
fish_add_path --path "$HOME/go/bin"
