# automatically run `brew update` once a day or so
#
# this doesn't upgrade the packages, it just lets me know if there are any upgrades available
if status is-interactive
    set --local perform_update 0
    set --local threshold (math '24 * 60 * 60')
    set --local now (date +%s)

    if set --query --universal __auto_brew_updated_at
        set --local diff (math "$now - $__auto_brew_updated_at")

        if test "$diff" -gt "$threshold"
            set perform_update 1
        end
    else
        set perform_update 1
    end

    if test "$perform_update" -eq 1
        brew update
        set --universal __auto_brew_updated_at $now
    end
end
