function autofetch --on-event "fish_prompt" --description 'Fetch on prompt'
  if test -f ".git/FETCH_HEAD"
    set --local mtime (path mtime --relative .git/FETCH_HEAD)

    if test "$mtime" -gt (math '10 * 60')
      git fetch --quiet
    end
  end
end
