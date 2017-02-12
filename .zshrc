# display red dots when preparing autocomplete
COMPLETION_WAITING_DOTS="true"

# don't set the title in tmux tabs
DISABLE_AUTO_TITLE="true"
setopt AUTO_CD

# allow brackets in commands, which lets you pass arguments to rake tasks
unsetopt nomatch

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export RUST_SRC_PATH="$HOME/src/rust/src"
export GOPATH="$HOME/src/gopath"
export PATH="$GOPATH/bin:$PATH"
alias grep='grep'

# User configuration

export BUNDLER_EDITOR=vim

source ~/.aliases
source ~/.tmux-helpers
source ~/.handy_functions
source ~/.golang-configuration
source ~/.chruby-configuration
source ~/.private-environment-variables
source ~/.linux-only-stuff
source ~/.docker-helpers
source ~/.prompt

# brew install keychain
# http://www.funtoo.org/Keychain
# https://github.com/funtoo/keychain
eval `keychain --quiet --eval --agents ssh --inherit any id_rsa`

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# For: https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data


# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# case-insensitive tab completion (borrowed from oh-my-zsh)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
