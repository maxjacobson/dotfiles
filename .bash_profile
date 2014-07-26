source ~/.aliases
source ~/.prompt
source ~/.handy_functions
source ~/.git-completion
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export EDITOR=vim

if [ -f $HOME/.ssh_destinations ];
then
  source $HOME/.ssh_destinations
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

