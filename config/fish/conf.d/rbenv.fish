# Configure rbenv to store rubies here instead of the default of ~/.rbenv
set --global --export RBENV_ROOT "$HOME/.cache/rbenv"

# Enables rbenv for this shell session
# install rbenv with `brew install rbenv`
eval "$(rbenv init - fish)"
