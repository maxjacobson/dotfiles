function jl --description "jj log command picker"
    set --local option (gum choose normal trunk full everything)

    switch $option
        case normal
            jj log
        case trunk
            jj log --revision "::trunk()"
        case full
            jj log --template builtin_log_compact_full_description
        case everything
            jj log --revision 'all()'
        case '*'
            echo "Unknown option: $option"
    end
end
