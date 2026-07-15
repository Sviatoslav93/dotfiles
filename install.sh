#!/usr/bin/env bash

set -eo pipefail

cd "$(dirname "$0")"

detect_os() {
  # shellcheck disable=SC1091
  source /etc/os-release
  case "$ID" in
    ubuntu|debian) echo "ubuntu" ;;
    *)
      case "$ID_LIKE" in
        *ubuntu*|*debian*) echo "ubuntu" ;;
        *)
          echo "Unsupported OS: ID=$ID ID_LIKE=$ID_LIKE" >&2
          exit 1
          ;;
      esac
      ;;
  esac
}

install_bat_symlink_ubuntu() {
  if ! command -v bat >/dev/null 2>&1; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(command -v batcat)" "$HOME/.local/bin/bat"
  fi
}

install_starship_ubuntu() {
  if ! command -v starship >/dev/null 2>&1; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
  fi
}

install_gcc_ubuntu() {
  sudo apt-get install -y build-essential gdb
}

install_lazygit_ubuntu() {
  command -v lazygit >/dev/null 2>&1 && return

  local lazygit_version lazygit_arch tmp_dir
  lazygit_version="$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" \
    | grep -Po '"tag_name": *"v\K[^"]*')"
  if [ -z "$lazygit_version" ]; then
    echo "install_lazygit_ubuntu: failed to resolve latest lazygit version" >&2
    exit 1
  fi
  lazygit_arch="$(uname -m | sed -e 's/aarch64/arm64/')"
  tmp_dir="$(mktemp -d)"

  curl -Lo "$tmp_dir/lazygit.tar.gz" \
    "https://github.com/jesseduffield/lazygit/releases/download/v${lazygit_version}/lazygit_${lazygit_version}_Linux_${lazygit_arch}.tar.gz"
  tar xf "$tmp_dir/lazygit.tar.gz" -C "$tmp_dir" lazygit
  sudo install "$tmp_dir/lazygit" -D -t /usr/local/bin/
  rm -rf "$tmp_dir"
}

install_ghostty_ubuntu() {
  command -v ghostty >/dev/null 2>&1 && return

  sudo apt install -y software-properties-common
  sudo add-apt-repository -y ppa:mkasberg/ghostty-ubuntu
  sudo apt update
  sudo apt install -y ghostty
}

install_dotnet_ubuntu() {
  sudo apt install -y dotnet-sdk-8.0
}

install_packages_ubuntu() {
  sudo apt update
  sudo apt install -y $(cat apt-packages.txt)

  install_bat_symlink_ubuntu
  install_starship_ubuntu
  install_lazygit_ubuntu
  install_ghostty_ubuntu
  install_dotnet_ubuntu
  install_fd
}

install_antidote() {
  local ANTIDOTE_DIR="$HOME/.local/share/antidote"
  if [ ! -d "$ANTIDOTE_DIR" ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
  fi
}

install_nerd_font() {
  local FONT_DIR="$HOME/.local/share/fonts/JetBrainsMono"
  if [ ! -d "$FONT_DIR" ]; then
    mkdir -p "$FONT_DIR"
    curl -fLo /tmp/JetBrainsMono.zip \
      https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"
    rm /tmp/JetBrainsMono.zip
    fc-cache -f "$FONT_DIR"
  fi
}

install_fd() {
  if command -v fd >/dev/null 2>&1 || command -v fdfind >/dev/null 2>&1; then
    return
  fi
  sudo apt install -y fd-find
}

install_nodejs(){
  # Download and install nvm:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

  # in lieu of restarting the shell
  \. "$HOME/.nvm/nvm.sh"

  # Download and install Node.js:
  nvm install 24

  # Verify the Node.js version:
  node -v # Should print "v24.18.0".

  # Download and install pnpm:
  corepack enable pnpm

  # Verify pnpm version:
  pnpm -v
}

stow_packages() {
  # --no-folding: stow individual files instead of a whole directory when the
  # target doesn't exist yet. Without it, e.g. `stow claude` on a machine with
  # no ~/.claude would symlink ~/.claude itself into the repo, so every
  # runtime file Claude Code writes under ~/.claude (credentials, sessions,
  # history, cache...) would land inside this git repo.
  stow --no-folding zsh
  stow --no-folding ghostty
  stow --no-folding starship
  stow --no-folding nvim
  stow --no-folding claude
  stow --no-folding lazygit
  stow --no-folding kitty
}

main() {
  local OS
  OS="$(detect_os)"

  [ "$OS" = "ubuntu" ] && install_packages_ubuntu

  install_antidote
  install_nerd_font
  install_nodejs

  stow_packages
}

main "$@"
