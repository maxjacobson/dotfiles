function fish_jj_prompt
    # Return early if jj isn't installed
    if not command -sq jj
        return 1
    end

    # Get current change ID (short), bookmarks, and conflict status
    set -l info (jj log --no-graph --ignore-working-copy --color=always --revisions @ \
        --template '
            separate(" ",
                bookmarks.join(" "),
                change_id.shortest(8),
                if(conflict, label("conflict", "×")),
            )
        ' 2>/dev/null)

    or return 1

    if test -n "$info"
        printf ' (%s)' $info
    end
end
