# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set --global --export ASDF_NODEJS_AUTO_ENABLE_COREPACK 1

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

    set --global --export DO_NOT_TRACK 1

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
        "$HOME/src/github/maxjacobson" \
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
end
