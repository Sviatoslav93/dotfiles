# Dotfiles

## Requirements

- Ubuntu
- Git

## Install

git clone ...

cd dotfiles

./install.sh

## GNOME settings

GNOME desktop settings (dconf) are snapshotted in `gnome/settings.ini`. They are not applied automatically by `./install.sh`.

- Save current settings to the repo: `./gnome/dump.sh`
- Apply the repo's saved settings to this machine: `./gnome/apply.sh` (overwrites live settings — read the prompt before confirming)
