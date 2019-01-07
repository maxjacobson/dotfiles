#!/usr/bin/env sh

set -eu

install_doctl() {
  unamestr=`uname`
  if [[ "$unamestr" == 'Darwin' ]]; then
    brew install doctl
  else
    aurget -Sy doctl-bin
  fi
}

command -v doctl >/dev/null || install_doctl
doctl completion zsh > ~/.doctl-completions.zsh
