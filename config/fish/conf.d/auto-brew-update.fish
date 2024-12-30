# automatically run `brew update` once a day or so
#
# this doesn't upgrade the packages, it just lets me know if there are any upgrades available
if status is-interactive
  set --local file "$HOME/.cache/fish/auto-brew-update.txt"
  set --local perform_update 0

  if test -f "$file"
    set --local mtime (path mtime --relative "$file")

    if test "$mtime" -gt (math '24 * 60 * 60')
      set perform_update 1
    end
  else
    set perform_update 1
  end

  if test "$perform_update" -eq "1"
    brew update
    touch "$file"
  end
end
