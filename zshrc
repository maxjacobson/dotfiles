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
export GOPATH="$HOME/src/gopath"
export PATH="$GOPATH/bin:$PATH"
alias grep='grep'

# use vim for things like aurget
export EDITOR=vim

# use emacs keybindings for shell navigation (even though EDITOR is vim)
set -o emacs
export BUNDLER_EDITOR=vim

source ~/.aliases
source ~/.tmux-helpers
source ~/.handy_functions
source ~/.chruby-configuration
source ~/.private-environment-variables
source ~/.os-specific-stuff
source ~/.prompt

# For git-completion, installed via rcm hook
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

export HIST_STAMPS="yyyy-mm-dd"
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

# makes up arrow and down arrow smarter (also C-p and C-n, for emacs-style up
# and down)
bindkey '^[[A' up-line-or-search
bindkey '^P' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^N' down-line-or-search

# case-insensitive tab completion (borrowed from oh-my-zsh)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# SSH Agent
ssh_env="$HOME/.ssh/agent-env"

if pgrep ssh-agent >/dev/null; then
  source "$ssh_env"
else
  ssh-agent | grep -Fv echo > "$ssh_env"
  source "$ssh_env"
  ssh-add
fi

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
