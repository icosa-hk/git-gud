#!/bin/bash
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

git push