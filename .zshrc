echo 'sourcing ~/.zshrc'

source ~/.aliases
source ~/.zprompt
source ~/.zhandy_functions

# brew install zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# add ~/bin to path
PATH=$HOME/bin:$PATH

setopt AUTO_CD # change directories just by referencing the directory name
PATH="$HOME/bin:$PATH"

# use vim for things like `bundle open rails`
export EDITOR="vim"

if [[ -d $HOME/go/bin ]]; then
  PATH="$HOME/go/bin:$PATH"
fi
export GOPATH="$HOME/go"

# git tab completion doesn't work without this:
autoload -U compinit && compinit

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"

if [[ -s "/usr/local/share/chruby/chruby.sh" ]]; then
  source "/usr/local/share/chruby/chruby.sh"
  chruby 2.2.0
fi
