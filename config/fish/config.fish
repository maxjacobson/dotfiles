eval "$(/opt/homebrew/bin/brew shellenv)"

# Add ~/bin to path
# This is a folder where I put custom helper scripts
# Most of them are stored in my dotfiles git repo and synced there by rcm
fish_add_path "$HOME/bin"

# Commands to run in interactive sessions can go here
if status is-interactive
  set -U fish_greeting

  # https://thoughtbot.com/blog/git-safe
  #
  # Run `mkdir -p .git/safe` in a trustworthy repo with a bin or exe folder
  #
  # If you do that, you can simply run `foo` and it will invoke bin/foo or exe/foo
  #
  # which is particularly nice for ruby projects that use binstubs
  set PATH \
    ".git/safe/../../bin" \
    ".git/safe/../../exe" \
    ".git/safe/../../node_modules/.bin" \
    $PATH

  # Some helpful tmux aliases
  # https://www.hardscrabble.net/2023/my-tmux-aliases/
  alias 't'='tmux new-session -A -s "$(basename $PWD) $(echo $PWD | shasum -a 256 | cut -c1-4)"'
  alias 'tl'="tmux list-sessions -F '#{s/ [a-f0-9][a-f0-9][a-f0-9][a-f0-9]\$//:session_name}' 2>/dev/null || echo 'no sessions'"
  alias 'ta'='tmux attach-session'
  alias 'to'='tmux attach-session -t'

  # colorizes file content output
  # https://github.com/sharkdp/bat
  alias cat='bat'

  # <3 vim
  #
  # But I use emacs key bindings to navigate inputting text into the shell
  # even though I prefer vim for editing text files,
  # when I'm not _in_ vim I don't really expect vim stuff to work.
  # And if I'm on a mac editing text I kind of expect emacs stuff to
  # work. And so here we are.
  set -gx EDITOR vim
  set -gx BUNDLER_EDITOR vim

  # makes it possible to run `cd Desktop` or `Desktop/` from anywhere, for example
  set CDPATH \
    "$HOME/src/gh/maxjacobson" \
    "$HOME/src/gh/hardscrabble" \
    "$HOME/src/local" \
    "$HOME" \
    $CDPATH

  # FZF
  #
  # This is configuration for the fuzzy file finder I use in vim
  # https://github.com/junegunn/fzf.vim
  set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --exclude .git"

  # brew install coreutils
  # sets LS_COLOR env var, which styles commands like fd, ls, and tree
  set -gx LS_COLORS (gdircolors -c | string split ' ')[3]

  # auto-load my ssh key
  # and read the passphrase from the keychain so I don't need to enter it every time
  ssh-add -q --apple-use-keychain
end
