function fish_prompt
  set -l last_status $status
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_showcolorhints true
  set -g __fish_git_prompt_char_stashstate "≡"
  set -g __fish_git_prompt_char_upstream_diverged "↑↓"
  set -g __fish_git_prompt_color_prefix "white"
  set -g __fish_git_prompt_color_suffix "white"
  set -g __fish_git_prompt_char_stateseparator " "
  set -g __fish_git_prompt_char_cleanstate ""

  echo ""
  string join '' -- (set_color blue) (prompt_pwd --full-length-dirs 2) (fish_vcs_prompt) (set_color normal)

  if test "$last_status" -ne 0
    string join '' -- (set_color red) '❯ '
  else
    string join '' -- (set_color magenta) '❯ '
  end
end
