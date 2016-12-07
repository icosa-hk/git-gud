#undo ADD
git reset --keep

#undo commit
git reset HEAD~1 --mixed

#undo PUSH
# as written is this blog post: http://megakemp.com/2016/08/25/git-undo/
git reset --hard $(git rev-parse --abbrev-ref HEAD)@{${1-1}};