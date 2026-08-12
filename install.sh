#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

configs=(
    hypr
    quickshell
    kitty
    matugen
    yazi
    hyprlock
)

for config in "${configs[@]}"; do
    target="$CONFIG_DIR/$config"
    source="$REPO_DIR/config/$config"

    if [[ -e "$target" || -L "$target" ]]; then
        rm -rf "$target"
    fi

    cp -a "$source" "$target"
    echo "Copied $config"
done

hyprctl reload

echo
echo "Installation complete."