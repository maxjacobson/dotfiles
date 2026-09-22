# Fast node manager
# https://github.com/Schniz/fnm

if status is-interactive
    set FNM_PATH "$HOME/.local/share/fnm"
    fish_add_path --path "$FNM_PATH"
    fnm env --use-on-cd --shell fish --log-level quiet | source
end
