#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
DOTFILES="$HOME/.dotfiles"

mkdir -p "$CONFIG_DIR"

# Create/update ~/.dotfiles
ln -sfn "$REPO_DIR" "$DOTFILES"

configs=(
    hypr
    quickshell
    kitty
    matugen
    yazi
    hyprlock
    walker
)

for config in "${configs[@]}"; do
    target="$CONFIG_DIR/$config"
    source="$REPO_DIR/config/$config"

    if [[ -L "$target" ]]; then
        rm "$target"
    elif [[ -e "$target" ]]; then
        mv "$target" "${target}.backup"
        echo "Backed up $target -> ${target}.backup"
    fi

    ln -s "$source" "$target"
    echo "Linked $config"
done

hyprctl reload

echo
echo "Installation complete."