#!/bin/bash
if [ ! $# == 1 ]; then
  echo "usage: git gud undo [add|commit|push]"
else
  case $1 in
    add )
      #undo ADD
      git reset --keep
      ;;
    commit )
      #undo commit
      git reset HEAD~1 --mixed
      ;;
    changes )
      #undo PUSH
      # as written is this blog post: http://megakemp.com/2016/08/25/git-undo/
      git reset --hard $(git rev-parse --abbrev-ref HEAD)@{1};
      ;;
    * )
      echo "git gud undo: $1 is not a valid command. See 'git gud man'."
      ;;
  esac
fi

