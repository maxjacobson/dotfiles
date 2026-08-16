# Clone repos from Codeberg.org
#
# Usage: codeberg-clone maxjacobson/film_snob
#
# Inspired by https://github.com/pbrisbin/dotfiles/blob/632ab65643eac277c77c18a2587fec17fd1acac3/zshrc#L19-L28
function codeberg-clone --description "Clone a repository from Codeberg.org" --argument-names repo
    switch "$repo"
        case "*/*"
            set --local target "$HOME/src/codeberg/$repo"
            if test -d "$target"
                _codeberg-clone-info "Already exists: $target"
                cd "$target"
            else
                mkdir -p "$target"

                _codeberg-clone-info "Attempting to clone with SSH"

                if git clone --quiet "ssh://git@codeberg.org/$repo.git" "$target"
                    _codeberg-clone-success "Successfully clone with SSH"
                    cd "$target"
                    return
                else
                    _codeberg-clone-info "SSH clone failed"
                    rm -rf "$target"
                end

                echo ""
                _codeberg-clone-info "Attempting to clone with HTTPS"
                if git clone --quiet "https://codeberg.org/$repo.git" "$target"
                    _codeberg-clone-success "Successfully clone with HTTPS"
                    cd "$target"
                    return
                else
                    _codeberg-clone-warn "HTTPS clone failed too"

                    rm -rf "$target"
                end
            end
        case '*'
            _codeberg-clone-warn "Bad input: $repo"
    end
end

function _codeberg-clone-success --argument-names msg
    string join '' -- (set_color green) "$msg" (set_color normal)
end

function _codeberg-clone-warn --argument-names msg
    string join '' -- (set_color yellow) "$msg" (set_color normal)
end

function _codeberg-clone-info --argument-name msg
    string join '' -- (set_color blue) "$msg" (set_color normal)
end
