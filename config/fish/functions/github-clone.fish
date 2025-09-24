# Clone repos from GitHub.
#
# Usage: github-clone maxjacobson/film_snob
#
# Inspired by https://github.com/pbrisbin/dotfiles/blob/632ab65643eac277c77c18a2587fec17fd1acac3/zshrc#L19-L28
function github-clone --description "Clone a repository from GitHub"
    switch "$argv"
        case "*/*"
            set --local target "$HOME/src/github/$argv"
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
            echo "Bad input: $argv"
    end
end
