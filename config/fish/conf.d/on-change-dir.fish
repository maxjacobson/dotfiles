function on_change_dir --on-variable PWD --description "Hooks to run on changing directory"
    if test -x .git/on-change-dir
        .git/on-change-dir
    else if test -x .jj/on-change-dir
        .jj/on-change-dir
    end
end
