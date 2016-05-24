# I find this helpful:
echo "Sourcing ~/.zshrc"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# where to look for custom themes/plugins
ZSH_CUSTOM=$HOME/.zsh-customizations

# Look in ~/.oh-my-zsh/themes/
# and ~/.zsh-customizations/themes
# or "random" to pick one randomly
ZSH_THEME="terrorhawk"

# display red dots when preparing autocomplete
COMPLETION_WAITING_DOTS="true"

# don't set the title in tmux tabs
DISABLE_AUTO_TITLE="true"


export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

# User configuration

export BUNDLER_EDITOR=vim

export ROOSTER_FILE="$HOME/Dropbox/.passwords"

source ~/.aliases
source ~/.tmux-helpers
source ~/.handy_functions
source ~/.golang-configuration
source ~/.chruby-configuration
source ~/.nvm-configuration
source ~/.private-environment-variables
source ~/.linux-only-stuff
