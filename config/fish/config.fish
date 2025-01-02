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

  # colorizes file content output
  # https://github.com/sharkdp/bat
  abbr --add cat bat

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

  # tmux helper abbreviations
  abbr --add t 'tmux new-session -A -s (basename $PWD)'
  abbr --add ta tmux attach-session
  abbr --add to tmux attach-session -t
  abbr --add tl tmux list-sessions

  # auto-load my ssh key
  # and read the passphrase from the keychain so I don't need to enter it every time
  ssh-add -q --apple-use-keychain
end
