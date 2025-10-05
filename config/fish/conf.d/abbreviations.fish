if status is-interactive
    # cat
    abbr --add cat bat

    # ls
    abbr --add ls eza \
        --group-directories-first \
        --icons=always \
        --all

    # tree
    abbr --add tree eza \
        --tree \
        --git-ignore \
        --group-directories-first \
        --icons=always \
        --all

    # git commands
    abbr --command git aa add --all
    abbr --command git authors shortlog --summary --numbered
    abbr --command git co checkout
    abbr --command git cp cherry-pick
    abbr --command git cpa cherry-pick --abort
    abbr --command git cpc cherry-pick --continue
    abbr --command git dc diff --cached
    abbr --command git l "log --pretty='%Cred%h %Creset%s%n%Cgreen%aN%Creset, %ar%n'"
    abbr --command git pick add . -p
    abbr --command git pro pull --rebase origin
    abbr --command git pru pull --rebase upstream
    abbr --command git ra rebase --abort
    abbr --command git rc rebase --continue
    abbr --command git recent-authors "shortlog --summary --numbered --since='2 weeks ago'"
    abbr --command git rh reset HEAD --hard
    abbr --command git rs rebase --skip
    abbr --command git st status --short
    abbr --command git sunrise commit --allow-empty --message '🌅'
    abbr --command git unstage restore --staged .

    # Habit breaker
    abbr --add t sl
    abbr --add tl sl

    # vim shortcuts
    abbr --command vim fish ~/.config/fish/config.fish
    abbr --command vim gitconfig ~/.config/git/config
    abbr --add vim nvim

    # bash/zsh-style !! to insert the last command from history
    function last_history_item
        echo $history[1]
    end
    abbr -a !! --position anywhere --function last_history_item
end
