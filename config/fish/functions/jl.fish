function jl --description "jj log command picker"
    set --local options normal mine trunk full everything wip

    set --local option (printf '%s\n' $options | fzf --no-sort --prompt 'jj log> ')

    switch $option
        case normal
            jj log
        case mine
            jj log --revision 'mine()'
        case trunk
            jj log --revision "::trunk()"
        case full
            jj log --template builtin_log_compact_full_description
        case everything
            jj log --revision 'all()'
        case wip
            jj log -r 'remote_bookmarks() & mine()'
        case ''
            return 0
        case '*'
            echo "Unknown option: $option" >&2
            return 1
    end
end
