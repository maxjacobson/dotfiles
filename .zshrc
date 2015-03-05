echo 'sourcing ~/.zshrc'

source ~/.aliases
source ~/.zprompt

setopt AUTO_CD # change directories just by referencing the directory name
setopt PRINT_EXIT_VALUE
PATH="$HOME/bin:$PATH"

# git tab completion doesn't work without this:
autoload -U compinit && compinit

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"

