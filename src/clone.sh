#!/bin/bash

if [ $# -gt 1 ]; then
  git clone $1 $2
  cd $2
  git submodule update --init --recursive
  cd ..
elif [ $# -gt 0 ]; then
  repoDir=$(basename $1)
  repoDir="${repoDir%.*}"
  git clone $1
  cd $repoDir
  git submodule update --init --recursive
  cd ..
else
  echo -n "Please enter the repo URL:"
  read repo
  repoDir=$(basename $repo)
  repoDir="${repoDir%.*}"
  echo -n "Please enter clone destination ($pwd/$repoDir):"
  read inDir
  if [[ ! $inDir == "" ]]; then
    repoDir=$inDir
  fi
  git clone $repo $repoDir
  cd $repoDir
  git submodule update --init --recursive
  cd ..
fi
