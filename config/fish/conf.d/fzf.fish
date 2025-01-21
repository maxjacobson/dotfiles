if status is-interactive
    # FZF
    #
    # This is configuration for the fuzzy file finder I use in vim
    # https://github.com/junegunn/fzf.vim
    set --global --export FZF_DEFAULT_COMMAND "fd --type f --hidden --exclude .git"
end
