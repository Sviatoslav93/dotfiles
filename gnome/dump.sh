#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

if ! command -v dconf >/dev/null 2>&1; then
  echo "dump.sh: dconf CLI not found (sudo apt install dconf-cli)" >&2
  exit 1
fi

# This repo is public, so scan the dump for anything that looks like a
# credential before it ever touches settings.ini. dconf itself doesn't store
# real secrets (those live in gnome-keyring), but a misbehaving extension
# could write one into its own dconf keys.
SENSITIVE_PATTERN='password|passwd|token|secret|api[_-]?key|credential|bearer|private[_-]?key'

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

dconf dump / > "$tmp"

if grep -inE "$SENSITIVE_PATTERN" "$tmp" > /dev/null; then
  echo "dump.sh: possible sensitive data found in the dump (this repo is public):" >&2
  grep -inE "$SENSITIVE_PATTERN" "$tmp" >&2
  read -r -p "Overwrite gnome/settings.ini with this dump anyway? [y/N] " reply
  case "$reply" in
    y|Y) ;;
    *) echo "Aborted. Nothing written."; exit 1 ;;
  esac
fi

mv "$tmp" settings.ini
trap - EXIT
echo "Dumped live dconf settings to gnome/settings.ini"
echo "Review with: git diff -- gnome/settings.ini"
