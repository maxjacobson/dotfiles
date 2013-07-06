# make and change into directory
function md () {
  mkdir -p "$@" && cd "$@";
}

# get current branch for prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# set prompt
export PS1="[\W]\$(parse_git_branch)\n\$(~/.emoji) "

# https://github.com/defunkt/hub
# use to create / fork github repos from command line
alias git=hub

# http://pryrepl.org/
alias irb=pry

# adds my custom bins to path
export PATH="$HOME/Dropbox/bin:$PATH"

# goto dropbox from anywhere, optionally specify subpaths
function box() {
  cd $HOME/Dropbox/$1
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"