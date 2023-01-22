setopt AUTO_CD

# allow brackets in commands, which lets you pass arguments to rake tasks
unsetopt nomatch

export PATH=$HOME/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export GOPATH="$HOME/src/gopath"
export PATH="$GOPATH/bin:$PATH"

# Indicate my preferred editor to various tools that check this
export EDITOR=vim

# use emacs keybindings for shell navigation (even though EDITOR is vim)
set -o emacs
export BUNDLER_EDITOR=vim

# Adds some color to the man output
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# starts emacs in a more minimalist mode
alias 'emacs'='emacs --no-window-system --quick'

# colorizes ls output
alias 'ls'='ls -G'

# colorizes file content output
# https://github.com/sharkdp/bat
alias 'cat'='bat'

# A handfy function that limits `tree` to just the files tracked by git
# https://www.hardscrabble.net/2019/tree-but-respecting-your-gitignore/
treeeee() {
  fd --type f --hidden --exclude .git | tree --fromfile "$@"
}

# some default behavior for ctags
alias 'ctags'='ctags -R --exclude=.git --exclude=node_modules'

# Some helpful tmux aliases
# https://www.hardscrabble.net/2015/some-helpful-tmux-aliases/
alias 't'='tmux new-session -A -s "$(basename $PWD | tr -d .\(\)\ )"'
alias 'tl'='tmux ls'
alias 'ta'='tmux attach'
alias 'to'='tmux attach -t'


# create and change into a directory
function md () {
  mkdir -p "$@" && cd "$@";
}

# Clone repos from GitHub.
#
# Usage: clone maxjacobson/film_snob
function clone () {
  splitter_rb="puts ARGV.fetch(0).split('/')"
  splitter_first_rb="$splitter_rb.first"
  splitter_last_rb="$splitter_rb.last"

  gh_user="$(ruby -e "$splitter_first_rb" "$@")"
  gh_repo="$(ruby -e "$splitter_last_rb" "$@")"
  gh_user_dir="$HOME/src/gh/$gh_user"

  mkdir -p "$gh_user_dir" &&
    cd "$gh_user_dir" &&
    if test -d "$gh_repo"; then
      echo "Already exists..."
    else
      set -x
      gh repo clone "$@"
    fi
    cd "$gh_repo"
}

# See:
# https://github.com/sindresorhus/pure
# https://www.hardscrabble.net/2021/pure-prompt/
#
# Must run:
# brew install pure

autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

if [[ "$TERM_PROGRAM" == 'vscode' ]]; then
  export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep-for-vscode"
else
  export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep"
fi

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

# Make alt + left arrow go back a word
bindkey '^[^[[D' backward-word
# Make alt + right arrow go forward a word
bindkey '^[^[[C' forward-word

# case-insensitive tab completion (borrowed from oh-my-zsh)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env --use-on-cd --log-level quiet`"

cdpath=(
  ~/src/gh/maxjacobson
  ~/src/gh/hardscrabble
  ~/
  $cdpath
)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(rbenv init - zsh)"
# https://thoughtbot.com/blog/git-safe
export PATH=".git/safe/../../bin:$PATH"
export PATH=".git/safe/../../exe:$PATH"

# Must run brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ssh-add -q --apple-use-keychain
