# Clone repos from Codeberg.org
#
# Usage: codeberg-clone maxjacobson/film_snob
#
# Inspired by https://github.com/pbrisbin/dotfiles/blob/632ab65643eac277c77c18a2587fec17fd1acac3/zshrc#L19-L28
function codeberg-clone --description "Clone a repository from Codeberg.org"
    switch "$argv"
        case "*/*"
            set --local target "$HOME/src/codeberg/$argv"
            if test -d "$target"
                echo "already exists"
                cd "$target"
            else
                mkdir -p "$target"
                if git clone "ssh://git@codeberg.org/$argv.git" "$target"
                    cd "$target"
                else
                    rm -rf "$target"
                end
            end
        case '*'
            echo "Bad input: $argv"
    end
end
