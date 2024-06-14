# vi: ft=ruby

# See also: https://github.com/Homebrew/homebrew-bundle
#
# This runs automatically via an rcm post-up hook

tap "heroku/brew"

cask "alacritty" # terminal emulator

brew "awscli" # Amazon Web Services (aws) CLI
brew "bash" # shell -- generally using zsh, but nice to have a modern version of bash around
brew "bat" # cat but with syntax highlighting
brew "cloc" # count lines of code
brew "fd" # find replacement
brew "fnm" # fast node.js manager
brew "gh" # New GitHub CLI, via https://github.com/cli/cli
brew "git" # version control
brew "git-delta" # Displays diffs pretty, exposes delta CLI
brew "git-lfs" # git large file storage
brew "heroku" # Heroku CLI
brew "htop" # CLI alternative to Activity Monitor, upgrade from the built-in top
brew "jq" # utility for pretty-printing and filtering streams of JSON-formatted text
brew "ncdu" # upgrade over du, helps you figure out where your disk space is going
brew "postgresql@16", restart_service: true, link: true, conflicts_with: ["postgresql"] # a database I sometimes use
brew "pure" # nice prompt https://www.hardscrabble.net/2021/pure-prompt/
brew "rbenv" # managing ruby versions
brew "rcm" # tool to manage dotfiles repository
brew "redis", restart_service: true # a database I sometimes use
brew "ripgrep" # grep replacement, exposes rg CLI
brew "shellcheck" # linter for shell scripts
brew "sl" # steam locomotive https://www.hardscrabble.net/2022/steam-locomotive/
brew "switchaudio-osx" # https://www.hardscrabble.net/2023/programming-my-macropad/
brew "tig" # git helper thing I use it to browse stashes on the command line
brew "tmux" # terminal multiplexer
brew "tfenv" # terraform version manager
brew "tree" # pretty-prints contents of a directory
brew "universal-ctags" # generate tags file
brew "vim" # primary text editor
brew "watch" # runs some command over and over
brew "wget" # download files
brew "yarn" # alternative to npm for managing node.js dependencies and tasks
brew "zsh" # preferred shell; need to add it to `/etc/shells` then run `chsh -s /opt/homebrew/bin/zsh`
brew "zsh-syntax-highlighting" # syntax highlights commands as you enter them into zsh shell
