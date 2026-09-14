function jjo --description "Open current branch on GitHub"
    if not command --search --query jj
        echo "jj not installed"
        return 1
    end

    if not test -d .jj
        echo "Not a jj repo"
        return 1
    end

    # Matches what gets displayed in the fish prompt
    set --local bookmarks (jj log --no-graph \
        --ignore-working-copy \
        --revisions @ \
        --template 'bookmarks.join(";;;")')

    set bookmarks (string split ";;;" "$bookmarks")
    set --local bookmark $bookmarks[1]

    if test -z "$bookmark"
        echo "Working copy @ has no bookmark"
        return 1
    end

    set --local repo

    set --local remotes (jj git remote list)

    for remote in (jj git remote list)
        set repo (string match --groups-only --regex "github\.com[/:]([\w\-]+\/[\w\-]+)\.git" "$remote")

        if test -z "$repo"
            break
        end
    end

    if test -z "$bookmark"
        echo "Could not work out the remote"
        return 1
    end

    gh browse --repo "$repo" --branch "$bookmark"
end
