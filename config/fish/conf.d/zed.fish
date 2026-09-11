if test "$ZED_TERM" = true
    # ls
    abbr --add ls eza \
        --group-directories-first \
        --long \
        --no-permissions \
        --no-user \
        --no-time \
        --all

    # tree
    abbr --add tree eza \
        --tree \
        --git-ignore \
        --group-directories-first \
        --all
end
