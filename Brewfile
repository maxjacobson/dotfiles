# vi: ft=ruby

# See also: https://github.com/Homebrew/homebrew-bundle
#
# This is invoked automatically via an rcm post-up hook

cask "homebrew-app" # GUI for homebrew itself

tap "charmbracelet/tap", trusted: true # allows installing crush directly from GitHub

brew "ast-grep" # ast-grep (sg)
brew "bat" # cat but with syntax highlighting
brew "btop" # top/htop alternatiave
brew "charmbracelet/tap/crush" # Charm Bracelet's AI harness
brew "cloc" # count lines of code
brew "fd" # find replacement
brew "fish" # My main shell; need to add it to `/etc/shells` then run `chsh -s /opt/homebrew/bin/fish`
brew "fnm" # fast node.js manager
brew "fzf" # fuzzy finder
brew "gh" # New GitHub CLI, via https://github.com/cli/cli 
brew "git" # version control
brew "git-delta" # Displays diffs pretty, exposes delta CLI
brew "git-lfs" # git large file storage
brew "gleam" # fun programming language
brew "go" # somewhat boring programming language
brew "graphviz" # generates graph images
brew "gum" # some shell scripting helpers
brew "htop" # CLI alternative to Activity Monitor, upgrade from the built-in top
brew "imagemagick-full" # generates images
brew "jj" # git alternative I am officially trying out and using as of September 2026
brew "jq" # utility for pretty-printing and filtering streams of JSON-formatted text
brew "just" # justfile support
brew "micro" # simple text editor to use every now and then
brew "ncdu" # upgrade over du, helps you figure out where your disk space is going
brew "neovim" # finally made the leap from regular old vim
brew "postgresql@18", restart_service: true, link: true, conflicts_with: ["postgresql"] # a database I sometimes use
brew "rcm" # tool to manage dotfiles repository
brew "ripgrep" # grep replacement, exposes rg CLI
brew "shellcheck" # linter for shell scripts
brew "sl" # steam locomotive https://www.hardscrabble.net/2022/steam-locomotive/
brew "switchaudio-osx" # https://www.hardscrabble.net/2023/programming-my-macropad/
brew "universal-ctags" # generate tags file
brew "vim" # primary text editor
brew "watch" # runs some command over and over
brew "wget" # download files

# Work-specific packages
if File.expand_path("~/FAMLI/Code").then { |path| File.exist?(path) }
  tap "datadog-labs/pack", trusted: true
  cask "1password-cli" # installs the `op` CLI for 1Password

  brew "awscli" # interact with AWS
  brew "datadog-labs/pack/pup" # DataDog CLI
  brew "gitleaks" # scans code for committed credentials
  brew "jiratui" # Jira TUI
  brew "tfenv" # terraform version manager
  brew "uv" # python tooling
  brew "valkey", restart_service: true # a database I sometimes use
  brew "zizmor" # lints github actions for security issues
end
