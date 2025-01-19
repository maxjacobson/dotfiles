function autofetch --on-event fish_prompt --description 'Fetch on prompt'
    if test -f ".git/FETCH_HEAD"
        set --local mtime (path mtime --relative .git/FETCH_HEAD)
        set --local duration (math '10 * 60')

        if test "$mtime" -gt "$duration"
            git fetch --prune --prune-tags --quiet
        end
    end
end
