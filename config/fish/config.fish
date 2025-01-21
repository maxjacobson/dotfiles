if status is-interactive
    # Setting the greeting to an empty list so fish doesn't display the default one
    # Can be restored like so:
    # set --universal --erase fish_greeting
    set --universal fish_greeting

    # https://thoughtbot.com/blog/git-safe
    #
    # Run `mkdir -p .git/safe` in a trustworthy repo with a bin, exe, or node_modules folder
    #
    # If you do that, you can simply run `foo` and it will invoke bin/foo or exe/foo
    #
    # which is particularly nice for ruby projects that use binstubs
    set PATH \
        ".git/safe/../../bin" \
        ".git/safe/../../exe" \
        ".git/safe/../../node_modules/.bin" \
        $PATH

    # <3 vim
    set --global --export EDITOR vim
    set --global --export BUNDLER_EDITOR vim

    # makes it possible to run `cd Desktop` or `Desktop/` from anywhere, for example
    set CDPATH \
        "$HOME/src/gh/maxjacobson" \
        "$HOME/src/gh/hardscrabble" \
        "$HOME/src/local" \
        "$HOME" \
        $CDPATH

    # brew install coreutils
    # sets LS_COLOR env var, which styles commands like fd, ls, and tree
    set --global --export LS_COLORS (gdircolors -c | string split ' ')[3]

    # auto-load my ssh key
    # and read the passphrase from the keychain so I don't need to enter it every time
    ssh-add -q --apple-use-keychain
end
