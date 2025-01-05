function fish_prompt
  # Check if the last command succeeded so we can color the prompt red when it
  # did not succeed
  set --local last_status $status

  # Configure fish_git_prompt to show some more info
  set --global __fish_git_prompt_show_informative_status true
  set --global __fish_git_prompt_showdirtystate true
  set --global __fish_git_prompt_showuntrackedfiles true
  set --global __fish_git_prompt_showstashstate true
  set --global __fish_git_prompt_showcolorhints true

  # Configure fish_git_prompt symbols
  set --global __fish_git_prompt_char_stashstate "≡" # inspired by pure
  set --global __fish_git_prompt_char_cleanstate "" # idc

  # blank line before each prompt
  echo ""

  # print some info
  string join '' -- \
    (set_color blue) (prompt_pwd --full-length-dirs 2) (set_color normal) \
    (fish_git_prompt)

  # print the actual prompt
  if test "$last_status" -ne 0
    string join '' -- (set_color red) '❯ '
  else
    string join '' -- (set_color magenta) '❯ '
  end
end
