function fish_jj_prompt
    # Return early if jj isn't installed
    if not command --search --query jj
        return 1
    end

    set --local info (_fish_jj_prompt_info)
    or return 1

    if test -n "$info"
        printf ' (%s)' $info
    end
end

# Get current change ID (short), bookmarks, and conflict status
function _fish_jj_prompt_info
    jj log --no-graph --ignore-working-copy --color=always --revisions @ \
        --template '
            separate(" ",
                bookmarks.join(" "),
                change_id.shortest(8),
                if(conflict, label("conflict", "×")),
            )
        ' 2>/dev/null
end
