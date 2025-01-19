if test "$TERM_PROGRAM" = vscode
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep-for-vscode"
else
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"
end
