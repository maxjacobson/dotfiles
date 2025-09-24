complete --command github-clone --no-files

function __fish_github_clone_repo_pattern
    set --local subpattern "[a-zA-Z0-9\-\_\.]+"
    echo "($subpattern)/?($subpattern)?"
end

# github-clone foo/<tab>
# github-clone foo/bar<tab>
# github-clone foo<tab>
function __fish_github_clone_should_search
    string match \
        --quiet \
        --regex (__fish_github_clone_repo_pattern) \
        (commandline --current-token)
end

# look up a particular owner's repos
function __fish_github_clone_search_results
    set --local groups (
      string match \
          --groups-only \
          --regex (__fish_github_clone_repo_pattern) \
          (commandline --current-token)
    )
    gh search repos \
        --owner="$groups[1]" \
        --json fullName \
        --jq '.[].fullName' \
        "$groups[2]"
end

# github-clone foo/<tab>
# will search GitHub for foo's repos and offer them as tab completions
complete \
    --command github-clone \
    --condition __fish_github_clone_should_search \
    --arguments '(__fish_github_clone_search_results)'
