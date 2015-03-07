echo 'sourcing ~/.zshrc'

source ~/.aliases
source ~/.zprompt

setopt AUTO_CD # change directories just by referencing the directory name
PATH="$HOME/bin:$PATH"

# git tab completion doesn't work without this:
autoload -U compinit && compinit

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"

if [[ -s "/usr/local/share/chruby/chruby.sh" ]]; then
  source "/usr/local/share/chruby/chruby.sh"
  chruby 2.2.0
fi
