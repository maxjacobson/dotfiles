function _autofetch --on-event fish_prompt --description 'Fetch jj/git repos when rendering prompt'
    if test -d ".jj"
        _jj_autofetch
    else if test -d ".git"
        _git_autofetch
    end
end

function _jj_autofetch --description 'Fetch a jj repo periodically'
    set --local cache_root $HOME/.cache

    set --local marker "$cache_root/fish-autofetch/$PWD/.last_fetch"

    set --local mtime
    if test -f $marker
        set mtime (path mtime --relative $marker)
    end

    if test -z "$mtime"; or test "$mtime" -gt 600
        mkdir -p (path dirname $marker)
        touch $marker
        jj git fetch
    end
end

function _git_autofetch --description 'Fetch a git repo periodically'
    set --local mtime

    # FETCH_HEAD doesn't exist on a freshly-cloned repo
    if test -f ".git/FETCH_HEAD"
        set mtime (path mtime --relative .git/FETCH_HEAD)
    else
        set mtime (path mtime --relative .git/HEAD)
    end

    if test "$mtime" -gt 600
        $HOME/.local/bin/autofetch &
    end
end
