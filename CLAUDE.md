# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles for an Ubuntu + Zsh + Neovim setup, managed with GNU Stow. Each top-level directory is a stow "package": its internal path layout mirrors `$HOME` exactly (e.g. `zsh/.zshrc` → `~/.zshrc`, `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`). When adding a new config file, place it under the matching package at the path it should occupy relative to `$HOME`; don't invent a new top-level layout. The one exception is `gnome/`, which stores GNOME desktop settings (dconf) rather than stow-managed dotfiles — see Architecture notes below.

## Installing / applying changes

```bash
./install.sh
```

This runs `stow <package>` for each package (zsh, alacritty, ghostty, starship, nvim, claude, lazygit, kitty, wezterm, herdr, zellij). Stow symlinks files from the package directory into `$HOME`, so editing a file in this repo immediately affects the live config once stowed; no build/compile step exists for any package here.

To stow/unstow an individual package while testing changes:

```bash
stow <package>      # from the repo root
stow -D <package>   # remove the symlinks
```

There is no test suite, linter, or CI in this repo — validate changes by stowing and exercising the tool (open a shell, launch nvim, etc.), not by running automated checks.

## Architecture notes

- **zsh (`zsh/.config/zsh/`)**: `.zshrc` sources every `*.zsh` file in this directory in a loop, so load order is filename order — files are prefixed accordingly where order matters (e.g. `zz-plugins.zsh` loads last). Plugins are managed by Antidote; `plugins.txt` is the plugin list, and `zz-plugins.zsh` auto-generates a bundled plugin loader at `~/.local/share/antidote/plugins.zsh` when missing or stale, then sources it.
- **nvim (`nvim/.config/nvim/`)**: `init.lua` branches on `vim.g.vscode`. Under the VSCode extension (`code.nvim`/`vscode-neovim`) it loads `lua/code/{options,keymaps,plugins}.lua`; under standalone Neovim it loads the top-level `lua/{options,keymaps,plugins,colorscheme}.lua`. These are two separate, independently maintained plugin/keymap sets — a change to one does not apply to the other, so mirror intentional behavior changes in both if needed. Both use `lazy.nvim` (bootstrapped inline at the top of each `plugins.lua`), pinned via `lazy-lock.json`.
- **claude (`claude/.claude/`)**: stows into `~/.claude/`. `settings.json` wires a custom status line script (`statusline.sh`) and a custom theme (`themes/github-dark.json`).
- **apt-packages.txt**: package manifest consumed by `install.sh`'s `install_packages_ubuntu` — one package name per line. Ghostty, lazygit, starship, and the .NET SDK are installed via explicit installer steps instead of a plain package-manager install and are intentionally absent from this file; see `install.sh` for details.
- **gnome/** (not a stow package): stores a full `dconf dump /` snapshot of GNOME desktop settings in `gnome/settings.ini`, for portability across machines. `gnome/dump.sh` overwrites `gnome/settings.ini` with the current live dconf database — run it manually after changing GNOME settings, then review with `git diff` before committing. Since the repo is public, `dump.sh` also scans the fresh dump for password/token/secret/credential-shaped strings and prompts for confirmation before overwriting `settings.ini` if it finds any. `gnome/apply.sh` loads `gnome/settings.ini` back into the live dconf database (`dconf load /`); this **replaces the entire database**, resetting anything not present in the file, so it is destructive and is intentionally **never invoked by `install.sh`** — run it manually and only when you mean to overwrite live settings on the current machine. dconf's live store is a binary db (`~/.config/dconf/user`), not a plain file GNOME reads by path, so this can't be handled with a Stow symlink like the other packages; `dconf-cli` (providing the `dconf` binary) is installed via `apt-packages.txt` like any other dependency.
