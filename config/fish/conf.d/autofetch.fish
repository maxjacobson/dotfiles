function _autofetch --on-event fish_prompt --description 'Fetch jj/git repos when rendering prompt'
    if test -d ".jj"
        if _autofetch_should_fetch
            jj git fetch
        end
    else if test -d ".git"
        if _autofetch_should_fetch
            git fetch
        end
    end
end

function _autofetch_should_fetch --description 'Determine whether it is time to fetch'
    set --local cache_root $HOME/.cache

    set --local marker "$cache_root/fish-autofetch/$PWD/.last_fetch"

    set --local mtime
    if test -f $marker
        set mtime (path mtime --relative $marker)
    end

    if test -z "$mtime"; or test "$mtime" -gt 600
        mkdir -p (path dirname $marker)
        touch $marker
        return 0
    else
        return 1
    end
end
