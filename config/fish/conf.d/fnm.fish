# Fast node manager
# https://github.com/Schniz/fnm

# fnm
set FNM_PATH "$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]
    # Linux???
    set PATH "$FNM_PATH" $PATH
    fnm env --use-on-cd --log-level quiet --shell fish | source
else
    # macOS???
    fnm env --use-on-cd --shell fish --log-level quiet | source
end
