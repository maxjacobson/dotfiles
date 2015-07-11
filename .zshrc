# Announce that this is the file that is configuring the shell
# I find this helpful!
echo 'sourcing ~/.zshrc'

source ~/.aliases
source ~/.prompt
source ~/.handy_functions
source ~/.golang-configuration
source ~/.chruby-configuration
source ~/.zsh-configuration

export PATH="$HOME/bin:$PATH" # add ~/bin to path
export EDITOR="vim" # use vim for `bundle open rails`, `git commit -v`, etc

