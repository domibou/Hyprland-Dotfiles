local programs = {
    terminal = "kitty",
    fileManager = "kitty -e yazi",
    launcher = "qs ipc call launcher open",
    browser = "brave",
    wallpaper = "bash ~/.dotfiles/scripts/wallpaper.sh",
    lockScreen = "hyprlock",
    screenshot = "grim -g \"$(slurp)\" - | swappy -f - -o ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
}

return programs
