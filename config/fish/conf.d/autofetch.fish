function _autofetch --on-event fish_prompt --description 'Fetch jj/git repos when rendering prompt'
    if test -d ".jj"
        _autofetch_with "jj git fetch"
    else if test -d ".git"
        _autofetch_with "git fetch"
    end
end

function _autofetch_with --argument-names fetch_command --description 'Run the given fetch command if it is time to fetch'
    if _autofetch_should_fetch
        echo "== $fetch_command"
        if eval $fetch_command
            echo "== ✅ autofetch succeeded"
        else
            echo "== ❌ autofetch failed"
        end
    end
end

function _autofetch_should_fetch --description 'Determine whether it is time to fetch'
    set --local marker "$HOME/.cache/fish-autofetch/$PWD/.last_fetch"

    set --local mtime
    if test -f $marker
        set mtime (path mtime --relative $marker)
    end

    if test -z "$mtime"; or test "$mtime" -gt 3600
        mkdir -p (path dirname $marker)
        touch $marker
        return 0
    else
        return 1
    end
end
