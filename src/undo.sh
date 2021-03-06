#!/bin/bash
if [ ! $# == 1 ]; then
  cat $HOME/.git-gud/bin/undo.txt
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
      # undo changes and revert to last commit
      # as written is this blog post: http://megakemp.com/2016/08/25/git-undo/
      git reset --hard $(git rev-parse --abbrev-ref HEAD)@{1};
      ;;
    push )
      # take the 2nd last commit and commit the changes needed for the last commit to revert to the 2nd last
      # as written is this blog post: http://megakemp.com/2016/08/25/git-undo/
      git revert HEAD~1
      ;;
    * )
      echo "git gud undo: $1 is not a valid command. See 'git gud man'."
      ;;
  esac
fi

