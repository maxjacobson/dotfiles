function fish_prompt
  set -l last_status $status
  set -g __fish_git_prompt_showupstream informative

  string join '' -- (set_color blue) (prompt_pwd --full-length-dirs 2) (set_color 5D5D5D) (fish_vcs_prompt) (set_color normal)

  if test "$last_status" -ne 0
    string join '' -- (set_color red) '❯ '
  else
    string join '' -- (set_color magenta) '❯ '
  end
end
