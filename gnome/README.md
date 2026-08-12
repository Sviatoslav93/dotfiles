# GNOME settings

GNOME desktop settings (dconf) are snapshotted here as a full `dconf dump /` — everything, not a curated subset.

This directory is **not** a Stow package: dconf's live store is a binary database (`~/.config/dconf/user`), not a plain file GNOME reads by path, so there's nothing here for Stow to symlink. It's also intentionally excluded from `./install.sh`'s automatic flow — applying settings is always a manual, explicit step.

- Save current settings to the repo: `./dump.sh` (overwrites `settings.ini`; review the result with `git diff -- gnome/settings.ini` before committing). Since this repo is public, `dump.sh` scans the fresh dump for password/token/secret/credential-shaped strings before writing it and asks for confirmation if it finds any — dconf itself doesn't store real secrets (those live in gnome-keyring), but a misbehaving extension could write one into its own keys.
- Apply the repo's saved settings to this machine: `./apply.sh` — **destructive**: `dconf load /` replaces the entire live database, resetting any setting not present in `settings.ini` to its default. The script asks for confirmation before running it.
