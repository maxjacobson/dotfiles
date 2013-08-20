# some aliases
alias git=hub
alias l='ls -lah'
alias ls='ls -G'
alias ll='ls -hl'
alias puts='less'
alias irb='pry'

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1 branch]/'
}

export PS1="[\@] \e[0;33m[\W]\e[1;35m \$(parse_git_branch)\e[00m\n\$(~/.emoji)  "

function desktop {
  cd /Users/$USER/Desktop/$@
}

function box {
  cd /Users/$USER/Dropbox/$@
}

# create and change into a directory
function md () {
  mkdir -p "$@" && cd "$@";
}

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# lets me use npm bins
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/Dropbox/bin:$PATH"

# keep this last
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*