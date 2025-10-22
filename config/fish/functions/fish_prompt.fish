function fish_prompt
    # Check if the last command succeeded so we can color the prompt red when it
    # did not succeed
    set --local last_status $status

    # Work out how many seconds the last command took if it was slow
    set --local duration_msg
    if test "$CMD_DURATION" -gt 2000
        set --local duration (math floor (math "$CMD_DURATION / 1000"))
        set duration_msg (string join '' -- " $duration" "s")
    end

    set --local fetching_msg

    if test -d .git/fish-autofetching
        set fetching_msg " 👀"
    end

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
        (fish_vcs_prompt) \
        (set_color yellow) "$duration_msg" \
        (set_color purple) "$fetching_msg" \
        (set_color normal)

    # print the actual prompt
    if test "$last_status" -ne 0
        string join '' -- (set_color red) '❯ '
    else
        string join '' -- (set_color magenta) '❯ '
    end
end
