if test "$TERM_PROGRAM" = vscode
    set --global --export RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep-for-vscode"
else
    set --global --export RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"
end
