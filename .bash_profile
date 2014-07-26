source ~/.aliases
source ~/.prompt
source ~/.handy_functions
source ~/.git-completion
export PATH="$HOME/bin:$PATH"
export EDITOR='vim'
# Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
