function autofetch --on-event fish_prompt --description 'Fetch on prompt'
    if test -d ".git"
        set --local mtime

        # FETCH_HEAD doesn't exist on a freshly-cloned repo
        if test -f ".git/FETCH_HEAD"
            set mtime (path mtime --relative .git/FETCH_HEAD)
        else
            set mtime (path mtime --relative .git/HEAD)
        end

        if test "$mtime" -gt 600
            $HOME/bin/autofetch &
        end
    end
end
