# Clone repos from GitHub.
#
# Usage: clone maxjacobson/film_snob
#
# Inspired by https://github.com/pbrisbin/dotfiles/blob/632ab65643eac277c77c18a2587fec17fd1acac3/zshrc#L19-L28
function clone --description "Clone a repository from GitHub"
    switch "$argv"
        case "*/*"
            set --local target "$HOME/src/gh/$argv"
            if test -d "$target"
                echo "already exists"
                cd "$target"
            else
                mkdir -p "$target"
                if gh repo clone "$argv" "$target"
                    cd "$target"
                else
                    rm -rf "$target"
                end
            end
        case '*'
            echo "Bad input"
    end
end
