# Zellij

Terminal multiplexer config. Stowed by `./install.sh` (`stow --no-folding zellij`) from `zellij/.config/zellij/config.kdl` → `~/.config/zellij/config.kdl`.

## Highlights

- Theme: `kanagawa`
- Default layout: `compact` (thin single-line tab bar, no status bar)
- `on_force_close "quit"` — closing the terminal window quits Zellij instead of leaving it detached
- `keybinds clear-defaults=true` — this config replaces Zellij's built-in keymap entirely; nothing below is a factory default
- **Starts in `locked` mode** (`default_mode "locked"`), not `normal`. In locked mode every keystroke passes straight through to the program running in the pane — Zellij only reacts to `Ctrl g`. This makes it safe to run things like Neovim or a shell without Zellij intercepting single-letter keys.

## The basic flow

1. Open a pane — you're in **locked** mode, typing goes to the shell/program as normal.
2. `Ctrl g` — switch to **normal** mode (Zellij now intercepts keys).
3. Press a mode key to enter a submode: `p` pane, `t` tab, `r` resize, `m` move, `s` scroll, `o` session.
4. Do the thing. Most actions in a submode switch back to **locked** automatically when they finish, so you rarely need to back out manually.
5. `Ctrl g` (or `Esc` in most submodes) always gets you back to locked. `Ctrl q` quits Zellij from anywhere except locked.

## Locked mode

| Key | Action |
|---|---|
| `Ctrl g` | Switch to normal mode |

## Pane mode (`normal` → `p`)

| Key | Action |
|---|---|
| `h` / `j` / `k` / `l` / arrows | Move focus left/down/up/right |
| `n` | New pane (returns to locked) |
| `d` | New pane, split down (returns to locked) |
| `r` | New pane, split right (returns to locked) |
| `x` | Close focused pane (returns to locked) |
| `f` | Toggle fullscreen on focused pane (returns to locked) |
| `e` | Toggle pane embedded/floating (returns to locked) |
| `w` | Toggle floating panes visibility (returns to locked) |
| `z` | Toggle pane frames (returns to locked) |
| `c` | Rename pane |
| `Tab` | Switch focus to next pane |

## Tab mode (`normal` → `t`)

| Key | Action |
|---|---|
| `h`/`j`/`k`/`l`, arrows | Previous/next tab |
| `1`–`9` | Jump to tab N (returns to locked) |
| `n` | New tab (returns to locked) |
| `x` | Close tab (returns to locked) |
| `r` | Rename tab |
| `s` | Toggle synchronized input across panes in tab (returns to locked) |
| `[` / `]` | Break pane out to a new tab, left/right (returns to locked) |
| `b` | Break pane into its own tab (returns to locked) |
| `Tab` | Toggle to last active tab |

## Resize mode (`normal` → `r`)

| Key | Action |
|---|---|
| `h`/`j`/`k`/`l`, arrows | Grow in that direction |
| `H`/`J`/`K`/`L` | Shrink in that direction |
| `+` / `=` | Increase size |
| `-` | Decrease size |

## Move mode (`normal` → `m`)

| Key | Action |
|---|---|
| `h`/`j`/`k`/`l`, arrows | Move pane in that direction |
| `n` / `Tab` | Move pane to next position |
| `p` | Move pane to previous position |

## Scroll mode (`normal` → `s`)

| Key | Action |
|---|---|
| `j` / `Down` | Scroll down a line |
| `k` / `Up` | Scroll up a line |
| `Ctrl f` / `PageDown` / `Right` | Page down |
| `Ctrl b` / `PageUp` / `Left` / `h` | Page up |
| `d` | Half-page down |
| `u` | Half-page up |
| `Ctrl c` | Scroll to bottom (returns to locked) |
| `e` | Edit scrollback in `$EDITOR` (returns to locked) |
| `f` | Enter search |
| `Alt h/j/k/l` | Move focus / switch tab, back to locked |

## Search mode (inside scroll, after `f` then `Enter`)

| Key | Action |
|---|---|
| `n` | Next match |
| `p` | Previous match |
| `c` | Toggle case sensitivity |
| `w` | Toggle whole-word |
| `o` | Toggle wrap |

## Session mode (`normal` → `o`)

| Key | Action |
|---|---|
| `d` | Detach from session |
| `w` | Open session manager (floating) |
| `p` | Open plugin manager (floating) |
| `c` | Open Zellij configuration UI (floating) |

## Global (available from most non-locked modes)

| Key | Action |
|---|---|
| `Alt h/j/k/l`, `Alt` + arrows | Move focus, or switch tab at the screen edge |
| `Alt n` | New pane |
| `Alt f` | Toggle floating panes |
| `Alt +` / `-` / `=` | Resize focused pane |
| `Alt [` / `]` | Previous/next swap layout |
| `Alt i` / `o` | Move current tab left/right |
| `Enter` | Return to locked mode |
| `Esc` | Return to locked mode (except while renaming) |
| `Ctrl g` | Toggle to locked mode |
| `Ctrl q` | Quit Zellij |

## Renaming panes/tabs

While renaming (`t` → `r` for a tab, `p` → `c` for a pane), just type the new name.

| Key | Action |
|---|---|
| `Esc` | Undo the rename and go back to tab/pane mode |
| `Ctrl c` | Cancel and return to locked mode |

## Editing this config

`~/.config/zellij/config.kdl` is a symlink into this repo — edit `zellij/.config/zellij/config.kdl` and changes apply on the next `zellij` restart (or run `zellij action ...` / reload the config UI for a running session, depending on what changed). See the KDL layout syntax and full action list in `zellij --help` / `man zellij` if you need to add more binds.
