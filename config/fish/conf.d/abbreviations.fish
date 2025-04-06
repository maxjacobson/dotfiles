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

    # tmux
    function __fish_t_command
        set --local name (path basename $PWD)
        echo "tmux new-session -A -s $name"
    end
    abbr --add --function __fish_t_command t
    abbr --add ta tmux attach-session
    abbr --add to tmux attach-session -t
    abbr --add tl tmux list-sessions

    # git commands
    abbr --command git aa add --all
    abbr --command git authors shortlog --summary --numbered
    abbr --command git co checkout
    abbr --command git cp cherry-pick
    abbr --command git cpa cherry-pick --abort
    abbr --command git cpc cherry-pick --continue
    abbr --command git dc diff --cached
    abbr --command git l "log --pretty='%Cred%h %Creset%<|(58,trunc)%s%n%Cgreen%aN%Creset, %ar%n'"
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
end
