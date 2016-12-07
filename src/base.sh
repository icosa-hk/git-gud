#!/bin/bash

if [ $# -gt 0 ]; then
  case $1 in
    init )
      init.sh
      ;;
    clone )
      shift 
      clone.sh $@
      ;;
    pull )
      pull.sh
      ;;
    push )
      push.sh
      ;;
    undo )
      shift
      undo.sh $@
      ;;
    profile )
      shift
      profile.sh $@
      ;;
    backmerge )
      backmerge.sh 
      ;;
    man )
      man.sh 
      ;;
    * )
      echo "git gud: $1 is not a valid command. See 'git gud man'."
      ;;
  esac
else
  cat $HOME/.git-gud/usage.txt
fi
