#!/bin/bash

main() {
  if [ -d "$HOME/.git-gud" ]; then
    rm -rf "$HOME/.git-gud"
  fi

  git clone https://github.com/icosa-hk/git-gud $HOME/.git-gud
  cd $HOME/.git-gud
  bash ./install.sh
}

main