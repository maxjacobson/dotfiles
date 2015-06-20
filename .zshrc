# Announce that this is the file that is configuring the shell
# I find this helpful!
echo 'sourcing ~/.zshrc'

source ~/.aliases
source ~/.prompt
source ~/.handy_functions
source ~/.golang-configuration
source ~/.chruby-configuration

fpath=(/usr/local/share/zsh-completions $fpath) # brew install zsh-completions
export PATH="$HOME/bin:$PATH" # add ~/bin to path
setopt AUTO_CD # change directories just by referencing the directory name
autoload -U compinit && compinit # git tab completion doesn't work without this
export EDITOR="vim" # use vim for `bundle open rails`, `git commit -v`, etc

