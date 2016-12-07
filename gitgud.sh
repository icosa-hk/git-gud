main() {
  if [ -d "$HOME/.git-gud" ]; then
    rm -rf "$HOME/.git-gud"
  if

  git clone https://github.com/icosa-hk/git-gud $HOME/.git-gud
  cd "$HOME/.git-gud"
  install.sh
}

main