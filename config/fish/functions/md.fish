function md --description "Make a directory and then cd into it" --argument-names dest
    mkdir -p "$dest" && cd "$dest"
end
