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

    set --global --export EDITOR nvim
    set --global --export BUNDLER_EDITOR nvim

    set --global --export PAGER gum-pager

    # move history files for some tools, just to not clutter up the home directory
    set --global --export LESSHISTFILE "$HOME/.cache/less/less_history"
    set --global --export NODE_REPL_HISTORY "$HOME/.cache/node/node_repl_history"
    set --global --export PSQL_HISTORY "$HOME/.cache/psql/psql_history"
    set --global --export PYTHON_HISTORY "$HOME/.cache/python/python_history"
    set --global --export REDISCLI_HISTFILE "$HOME/.cache/redis/rediscli_history"
    set --global --export RUBY_DEBUG_HISTORY_FILE "$HOME/.cache/ruby/rdbg_history"
    set --global --export SQLITE_HISTORY "$HOME/sqlite/sqlite_history"

    # makes it possible to run `cd Desktop` or `Desktop/` from anywhere, for example
    set CDPATH \
        "$HOME/src/gh/maxjacobson" \
        "$HOME/src/local" \
        "$HOME" \
        $CDPATH

    # sets LS_COLOR env var, which styles commands like fd, ls, and tree
    if test Linux = (uname)
        set --global --export LS_COLORS (dircolors -c | string split ' ')[3]
    else
        # brew install coreutils
        set --global --export LS_COLORS (gdircolors -c | string split ' ')[3]
    end

    if ! test Linux = (uname)
        # auto-load my ssh key
        # and read the passphrase from the keychain so I don't need to enter it every time
        ssh-add -q --apple-use-keychain
    end

    fnm env --use-on-cd --shell fish --log-level quiet --corepack-enabled | source
end
