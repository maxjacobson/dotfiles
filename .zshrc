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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(chruby)

export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

# User configuration

export BUNDLER_EDITOR=vim

source ~/.aliases
source ~/.tmux-helpers
source ~/.handy_functions
source ~/.golang-configuration
source ~/.chruby-configuration
source ~/.nvm-configuration
source ~/.private-environment-variables
source ~/.linux-only-stuff
