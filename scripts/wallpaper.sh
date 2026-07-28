#!/usr/bin/env bash

set -euo pipefail

DIR="$HOME/.dotfiles/wallpapers"

IMAGE=$(
    fd -e jpg -e jpeg -e png -e webp -e avif . "$DIR" \
        -x basename \
    | walker --dmenu --provider menus:wallpapers --theme wallpaper
)

[[ -z "$IMAGE" ]] && exit 0

matugen image "$DIR/$IMAGE" --source-color-index 0

awww img "$DIR/$IMAGE" \
    --transition-type wipe \
    --transition-fps 165 \
    --transition-duration 1