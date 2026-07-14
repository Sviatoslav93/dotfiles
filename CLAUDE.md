# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles for an Ubuntu + Zsh + Neovim setup, managed with GNU Stow. Each top-level directory is a stow "package": its internal path layout mirrors `$HOME` exactly (e.g. `zsh/.zshrc` → `~/.zshrc`, `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`). When adding a new config file, place it under the matching package at the path it should occupy relative to `$HOME`; don't invent a new top-level layout.

## Installing / applying changes

```bash
./install.sh
```

This runs `stow <package>` for each package (git, zsh, ghostty, starship, nvim, claude — zellij is present but currently commented out). Stow symlinks files from the package directory into `$HOME`, so editing a file in this repo immediately affects the live config once stowed; no build/compile step exists for any package here.

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
