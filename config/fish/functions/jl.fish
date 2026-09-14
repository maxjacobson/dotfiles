function jl --description "jj log command picker"
    set --local option (gum choose normal trunk full)

    switch $option
        case normal
            jj log
        case trunk
            jj log --revision "::trunk()"
        case full
            jj log --template builtin_log_compact_full_description
        case '*'
            echo "Unknown option: $option"
    end
end
