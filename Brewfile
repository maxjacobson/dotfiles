# vi: ft=ruby

# See also: https://github.com/Homebrew/homebrew-bundle
#
# This runs automatically via an rcm post-up hook

cask "1password-cli"

brew "awscli"
brew "bat" # cat but with syntax highlighting
brew "btop" # top/htop alternatiave
brew "cloc" # count lines of code
brew "coreutils" # installs gdircolors and others
brew "eza" # modern ls
brew "fd" # find replacement
brew "fish" # My main shell; need to add it to `/etc/shells` then run `chsh -s /opt/homebrew/bin/fish`
brew "fnm" # fast node.js manager
brew "gh" # New GitHub CLI, via https://github.com/cli/cli
brew "git" # version control
brew "gitleaks"
brew "git-delta" # Displays diffs pretty, exposes delta CLI
brew "git-lfs" # git large file storage
brew "graphviz"
brew "gum" # some shell scripting helpers
brew "htop" # CLI alternative to Activity Monitor, upgrade from the built-in top
brew "imagemagick"
brew "jq" # utility for pretty-printing and filtering streams of JSON-formatted text
brew "micro" # simple text editor to use every now and then
brew "neovim" # finally made the leap from regular old vim
brew "ncdu" # upgrade over du, helps you figure out where your disk space is going
brew "postgresql@16", restart_service: true, link: true, conflicts_with: ["postgresql"] # a database I sometimes use
brew "rbenv" # managing ruby versions
brew "rcm" # tool to manage dotfiles repository
brew "redis", restart_service: true # a database I sometimes use
brew "ripgrep" # grep replacement, exposes rg CLI
brew "ruby", version_file: File.expand_path("~/.rbenv/version")
brew "rv" # new rbenv alternative
brew "shellcheck" # linter for shell scripts
brew "sl" # steam locomotive https://www.hardscrabble.net/2022/steam-locomotive/
brew "switchaudio-osx" # https://www.hardscrabble.net/2023/programming-my-macropad/
brew "terraform-docs" # generates terraform docs automatically
brew "tfenv" # terraform version manager
brew "universal-ctags" # generate tags file
brew "vim" # primary text editor
brew "watch" # runs some command over and over
brew "wget" # download files
brew "zizmor" # lints github actions for security issues
