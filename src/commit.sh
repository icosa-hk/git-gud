#!/bin/bash
cmd=$1
shift

git status

if [ $# -gt 0 ]; then
  git add $@
else 
  echo "Please specify the files you want to commit (all)"
  read files
  if [[ $files == "" ]];then
    files='.'
  fi
  git add $files
fi

message=""
while [[ $message == "" ]]
do
  echo "Please enter a commit message:"
  read -r message
done
git commit -m "$message"

if [[ $cmd == push ]]; then
  git push
else

  echo "Do you want to push to remote? (Y/n):"
  old_stty_cfg=$(stty -g)
  stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Care playing with stty
  if echo "$answer" | grep -iq "^y" ; then
    echo "Yes"
    git push
  else
    echo "No"
    exit 0
  fi
fi