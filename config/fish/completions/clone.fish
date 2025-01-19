complete --command clone --no-files

function __fish_clone_repo_pattern
    set --local subpattern "[a-zA-Z0-9\-\_\.]+"
    echo "($subpattern)/?($subpattern)?"
end

# clone foo/<tab>
# clone foo/bar<tab>
# clone foo<tab>
function __fish_clone_should_search
    string match \
        --quiet \
        --regex (__fish_clone_repo_pattern) \
        (commandline --current-token)
end

# look up a particular owner's repos
function __fish_clone_search_results
    set --local groups (
      string match \
          --groups-only \
          --regex (__fish_clone_repo_pattern) \
          (commandline --current-token)
    )
    gh search repos \
        --owner="$groups[1]" \
        --json fullName \
        --jq '.[].fullName' \
        "$groups[2]"
end

# clone foo/<tab>
# will search GitHub for foo's repos and offer them as tab completions
complete \
    --command clone \
    --condition __fish_clone_should_search \
    --arguments '(__fish_clone_search_results)'
