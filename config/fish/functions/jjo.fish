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

    set --local repo

    set --local remotes (jj git remote list)

    for remote in (jj git remote list)
        set repo (string match --groups-only --regex "github\.com[/:]([\w\-]+\/[\w\-]+)\.git" "$remote")

        if test -z "$repo"
            break
        end
    end

    if test -z "$repo"
        echo "Could not work out the remote"
        return 1
    end

    if test -n "$bookmark"
        # The pulls endpoint wants the head branch qualified with its owner, so
        # it only finds pull requests opened from this repository. An empty
        # result means there is no pull request for this bookmark.
        set --local owner (string split / $repo)[1]
        set --local pr_number (gh api \
            --method GET \
            "repos/$repo/pulls" \
            --field "head=$owner:$bookmark" \
            --field "state=all" \
            --jq '.[0].number // empty' 2>/dev/null)

        if test -n "$pr_number"
            # gh browse takes a repo, path, commit, or number. It builds an
            # /issues/N URL for a number, which GitHub redirects to /pull/N
            gh browse --repo "$repo" "$pr_number"
        else
            gh browse --repo "$repo" --branch "$bookmark"
        end
    else
        gh browse --repo "$repo"
    end
end
