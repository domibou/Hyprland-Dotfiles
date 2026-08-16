local programs = {
    terminal = "kitty",
    fileManager = "kitty -e yazi",
    launcher = "qs ipc call launcher open",
    browser = "brave",
    wallpaper = "qs ipc call wallpaper open",
    lockScreen = "hyprlock --config ~/.config/hyprlock/hyprlock.conf",
    screenshot = "grim -g \"$(slurp)\" - | swappy -f - -o ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png",
    settings = "qs ipc call settings open",
}

return programs
