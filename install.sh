#!/bin/bash
# VS Code Dev Containers runs this once in every new container (dotfiles.installCommand).
# It must be safe to run again: every step checks before it changes anything.
set -e
cd "$(dirname "$0")"

if ! command -v zsh >/dev/null; then
  sudo apt-get update && sudo apt-get install -y zsh
fi

if ! command -v starship >/dev/null; then
  curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes
fi

mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

starship_init='eval "$(starship init zsh)"'
grep -qxF "$starship_init" ~/.zshrc 2>/dev/null || echo "$starship_init" >> ~/.zshrc

sudo chsh -s "$(command -v zsh)" "$USER"
