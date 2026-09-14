function jl --description "jj log command picker"
    set --local options normal trunk full everything

    set --local option (printf '%s\n' $options | fzf --no-sort --prompt 'jj log> ')

    switch $option
        case normal
            jj log
        case trunk
            jj log --revision "::trunk()"
        case full
            jj log --template builtin_log_compact_full_description
        case everything
            jj log --revision 'all()'
        case ''
            return 0
        case '*'
            echo "Unknown option: $option" >&2
            return 1
    end
end
