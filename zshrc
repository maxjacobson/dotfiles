# allow brackets in commands, which lets you pass arguments to rake tasks
unsetopt nomatch

# Add ~/bin to path
# This is a folder where I put custom helper scripts
# Most of them are stored in my dotfiles git repo and synced there by rcm
export PATH=$HOME/bin:$PATH

export PATH=$HOME/.docker/bin:$PATH

# <3 vim
#
# But I use emacs key bindings to navigate inputting text into the shell
# even though I prefer vim for editing text files,
# when I'm not _in_ vim I don't really expect vim stuff to work.
# And if I'm on a mac editing text I kind of expect emacs stuff to
# work. And so here we are.
export EDITOR=vim
export BUNDLER_EDITOR=vim
setopt emacs

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

# Some helpful tmux aliases
# https://www.hardscrabble.net/2023/my-tmux-aliases/
alias 't'='tmux new-session -A -s "$(basename $PWD) $(echo $PWD | shasum -a 256 | cut -c1-4)"'
alias 'tl'="tmux list-sessions -F '#{s/ [a-f0-9][a-f0-9][a-f0-9][a-f0-9]$//:session_name}' 2>/dev/null || echo 'no sessions'"
alias 'ta'='tmux attach-session'
alias 'to'='tmux attach-session -t'

# create and change into a directory
function md () {
  mkdir -p "$@" && cd "$@";
}

# Clone repos from GitHub.
#
# Usage: clone maxjacobson/film_snob
#
# Inspired by https://github.com/pbrisbin/dotfiles/blob/632ab65643eac277c77c18a2587fec17fd1acac3/zshrc#L19-L28
function clone () {
  case "$1" in
    */*)
      target="$HOME/src/gh/$1"

      if [ -d "$target" ]; then
        echo "already exists"
        cd "$target"
      else
        mkdir -p "$target"
        gh repo clone "$1" "$target"
        cd "$target"
      fi

      ;;
    *)
      echo "Bad input"
      ;;
  esac
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

alias history='fc -il 1'

setopt extended_history # record timestamp of command in HISTFILE
setopt hist_verify # show command with history expansion to user before running it
setopt share_history # share command history data across shell sessions

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
#
# This is configuration for the fuzzy file finder I use in vim
# https://github.com/junegunn/fzf.vim
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"

# fnm
# fast node manager
# this configures fnm to auto-switch node versions when it sees a `.node-version` file
# and also prompt you to install missing versions
# https://github.com/Schniz/fnm
eval "`fnm env --use-on-cd --log-level quiet`"

# makes it possible to run `cd Desktop` from anywhere, for example
cdpath=(
  ~/src/gh/maxjacobson
  ~/src/gh/hardscrabble
  ~/src/local
  ~/
  $cdpath
)

# Lets you simply type simply Desktop to cd into the desktop, rather than `cd Desktop`
setopt autocd

# rcm will auto-install it from https://github.com/zsh-users/zsh-autosuggestions
# Adds auto-complete to commands based on your shell history
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enables rbenv for this shell session
# install rbenv with `brew install rbenv`
eval "$(rbenv init - zsh)"

# https://thoughtbot.com/blog/git-safe
#
# Run `mkdir -p .git/safe` in a trustworthy repo with a bin or exe folder
#
# If you do that, you can simply run `foo` and it will invoke bin/foo or exe/foo
#
# which is particularly nice for ruby projects that use binstubs
export PATH=".git/safe/../../bin:$PATH"
export PATH=".git/safe/../../exe:$PATH"

# highlights commands as you type them in the shell
#
# Must run `brew install zsh-syntax-highlighting`
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

####### ~*~ Work Stuff *~ #############
if [ -d ~/FAMLI ]; then
  export AWS_PROFILE=FAMLI-ReadOnlyAccess
  export MD_FAMLI_GIT_HOOKS_PRE_PUSH=1
  export MD_FAMLI_GIT_HOOKS_PRE_PUSH_RSPEC=1
  export MD_FAMLI_GIT_HOOKS_PRE_PUSH_BRAKEMAN=1

  cdpath=(
    ~/FAMLI/Code
    $cdpath
  )

  if [ -f "$HOME/FAMLI/Code/md-famli-infrastructure/exe/functions.sh" ]; then
    source "$HOME/FAMLI/Code/md-famli-infrastructure/exe/functions.sh"
  else
    echo "md-famli-infrastructure helper functions missing"
  fi
fi
#######################################

# auto-load my ssh key
# and read the passphrase from the keychain so I don't need to enter it every time
ssh-add -q --apple-use-keychain
