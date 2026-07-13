#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

# Package installation
sudo dnf install -y dnf5-plugins
sudo dnf copr enable -y scottames/ghostty
sudo dnf copr enable -y atim/starship
sudo dnf copr enable -y dejan/lazygit
sudo dnf install -y $(cat dnf-packages.txt)

# Antidote (zsh plugin manager)
ANTIDOTE_DIR="$HOME/.local/share/antidote"
if [ ! -d "$ANTIDOTE_DIR" ]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi

# JetBrainsMono Nerd Font
FONT_DIR="$HOME/.local/share/fonts/JetBrainsMono"
if [ ! -d "$FONT_DIR" ]; then
  mkdir -p "$FONT_DIR"
  curl -fLo /tmp/JetBrainsMono.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"
  rm /tmp/JetBrainsMono.zip
  fc-cache -f "$FONT_DIR"
fi

# Symlink dotfiles into place
stow zsh
stow ghostty
stow starship
# stow zellij
stow nvim
stow claude
stow lazygit
