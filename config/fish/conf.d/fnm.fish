# fnm
# fast node manager
# this configures fnm to auto-switch node versions when it sees a `.node-version` file
# and also prompt you to install missing versions
# https://github.com/Schniz/fnm
fnm env --use-on-cd --shell fish --log-level quiet --corepack-enabled | source
