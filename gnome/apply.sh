#!/usr/bin/env bash
set -eo pipefail
cd "$(dirname "$0")"

if ! command -v dconf >/dev/null 2>&1; then
  echo "apply.sh: dconf CLI not found (sudo apt install dconf-cli)" >&2
  exit 1
fi

if [ ! -f settings.ini ]; then
  echo "apply.sh: gnome/settings.ini not found" >&2
  exit 1
fi

echo "This replaces your ENTIRE dconf database (dconf load /) with gnome/settings.ini."
echo "Any live GNOME setting not present in that file will be reset to its default."
read -r -p "Continue? [y/N] " reply
case "$reply" in
  y|Y) ;;
  *) echo "Aborted."; exit 1 ;;
esac

dconf load / < settings.ini
echo "Applied gnome/settings.ini to the live dconf database."
