# branch-plucking line via mostly via http://stackoverflow.com/a/1128583
# uncommitted work check mostly via via http://0xfe.blogspot.com/2010/04/adding-git-status-information-to-your.html
git_prompt() {
  if [[ -d .git ]]; then # we are in a git repo (-d checks existence of a directory)
    if [[ -e .git/rebase-apply ]]; then # we are mid-rebase (-e checks existence of a file)
      echo " %F{red}%B(mid rebase)%b%f"
    elif [[ -e .git/CHERRY_PICK_HEAD ]]; then # we are mid cherry-pick
      echo " %F{magenta}%B(mid cherry-pick)%b%f"
    elif [[ $(git diff HEAD --shortstat 2> /dev/null | tail -n1) != "" ]]; then # we have uncommitted work among our tracked files
      branch=$(git symbolic-ref HEAD | cut -d'/' -f3)
      echo " %F{red}%B$branch*%b%f"
    else
      branch=$(git symbolic-ref HEAD | cut -d'/' -f3)
      echo " %F{green}%B$branch%b%f"
    fi
  else
    echo " %F{blue}%B(not repo)%b%f"
  fi
}

PROMPT="%F{grey}%C%f \$(emojify \$(random_nice_emoji)) \$(git_prompt) "
