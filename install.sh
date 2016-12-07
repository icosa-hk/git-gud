#!/bin/bash

install_files () { 
  echo "Installing Git-Gud at $HOME/.git-gud/bin "
  cd "src"
  for f in *; do
    if [[ $f != base.sh ]]; then
        # echo "$f"
        cp "$f" "$HOME/.git-gud/bin"
        
        if [[ $f == *.sh ]]; then
          chmod "u=rx" "$HOME/.git-gud/bin/$f"
        fi
    fi
  done
  
  echo -n ">>"
  cp "base.sh" "$HOME/.git-gud/bin/git-gud"
  chmod "u=rx" "$HOME/.git-gud/bin/git-gud"
  
  echo -n ">>"
  cd ".."
  echo  " Done"
}

add_path_manually(){
  echo "Please add the following to your path manually"
  echo "export PATH=\"$HOME/.git-gud/bin:\${PATH}\""
}

write_to_rc(){
  echo "Adding path to $1 "
  
  # Remove Path if it already exist
  grep "-v" "#Added by Git Gud" "$HOME/$1" > "temp" && mv "temp" "$HOME/$1"
  grep "-v" "export PATH=\"$HOME/.git-gud/bin:\${PATH}\"" "$HOME/$1" > "temp" && mv "temp" "$HOME/$1"
  echo -n ">>"

  # Echo in the path
  echo "#Added by Git Gud" >> "$HOME/$1"  
  echo "export PATH=\"$HOME/.git-gud/bin:\${PATH}\"" >> "$HOME/$1"   
  echo ">> Done"

  # Reload the rc
  echo "Reloading $1: source $HOME/$1"
  . $HOME/$1
  echo ">> Done"
}

add_files_to_path (){
  if [[ $SHELL == *bash* ]]; then
    echo "You are using bash, do you want to add path to .bashrc? (y/n)"
    stty_rc=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $stty_rc # Care playing with stty
    if echo "$answer" | grep -iq "^y" ; then
      echo "Yes"
      write_to_rc .bashrc
    else
        echo "No"
        add_path_manually
    fi
  elif [[ $SHELL == *zsh* ]]; then
    echo "You are using zsh, do you want to add path to .zshrc? (y/n)"
    stty_rc=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $stty_rc # Care playing with stty
    if echo "$answer" | grep -iq "^y" ; then
      echo "Yes"
      write_to_rc .zshrc
    else
        echo "No"
        add_path_manually
    fi
  fi
}

if [ ! -d "$HOME/.git-gud/bin" ]; then
  mkdir "$HOME/.git-gud/bin"
  install_files
  add_files_to_path
else
  echo -n "Git-Gud already exists, overwrite? (y/n)? "
  old_stty_cfg=$(stty -g)
  stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Care playing with stty
  if echo "$answer" | grep -iq "^y" ;then
    echo "Yes"
    rm -rf "$HOME/.git-gud/bin"
    mkdir "$HOME/.git-gud/bin"
    install_files
    add_files_to_path
  else
    echo "No"
    echo "Quitting git-gud installation, goodbye :)"
    exit 0
  fi
fi

echo "Git-Gud Installation Complete, use \`git gud man\` for usage manual"

exit 0