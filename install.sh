#!/bin/bash


# source ~/.bashrc

# # added by Anaconda3 4.2.0 installer
# export PATH="/Users/wil/anaconda/bin:$PATH"


install_files () { 
  echo "Installing Git-Gud at $HOME/.git-gud "
  cd "src"
  for f in *; do
    if [[ $f != base.sh ]]; then
        # $f is a directory
        echo "$f"
        cp "$f" "$HOME/.git-gud"
        chmod "u=rx" "$HOME/.git-gud/$f"
    fi
  done
  
  echo -n ">>"
  cp "base.sh" "$HOME/.git-gud/git-gud"
  chmod "u=rx" "$HOME/.git-gud/git-gud"
  
  echo -n ">>"
  cd ".."
  echo  " Done"
}

add_files_to_path (){
  echo "Adding path to bash profile "
  grep "-v" "#Added by Git Gud" "$HOME/.bash_profile" > "temp" && mv "temp" "$HOME/.bash_profile"
  grep "-v" "export PATH=\"$HOME/.git-gud:\${PATH}\"" "$HOME/.bash_profile" > "temp" && mv "temp" "$HOME/.bash_profile"
  echo -n ">>"

  echo "" >> "$HOME/.bash_profile"  
  echo "#Added by Git Gud" >> "$HOME/.bash_profile"  
  echo "export PATH=\"$HOME/.git-gud:\${PATH}\"" >> "$HOME/.bash_profile"  
  echo "" >> "$HOME/.bash_profile"  
  echo -n ">>"

  source "$HOME/.bash_profile"
  echo  ">> Done"
}

if [ ! -d "$HOME/.git-gud" ]; then
  mkdir "$HOME/.git-gud"
  install_files
  add_files_to_path
else
  echo -n "Git-Gud already exists, overwrite? (y/n)? "
  old_stty_cfg=$(stty -g)
  stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Care playing with stty
  if echo "$answer" | grep -iq "^y" ;then
      echo "Yes"
      rm -rf "$HOME/.git-gud"
      mkdir "$HOME/.git-gud"
      install_files
      add_files_to_path
  else
      echo "No"
      echo "Quitting git-gud installation, goodbye :)"
      exit 0
  fi
fi

echo "Git-Gud Installation Complete, use \`git gud man\` for usage manual"
