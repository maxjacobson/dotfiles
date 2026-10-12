if test "$ZED_TERM" = true
    # ls
    abbr --add ls eza \
        --group-directories-first \
        --long \
        --no-permissions \
        --no-user \
        --no-time \
        --ignore-glob .jj \
        --all

    # tree
    abbr --add tree eza \
        --tree \
        --git-ignore \
        --ignore-glob .jj \
        --group-directories-first \
        --all
end
