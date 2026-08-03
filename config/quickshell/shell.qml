import Quickshell
import Quickshell.Hyprland

import "windows/bar"
import "windows/volume"


ShellRoot {
    id: root

    readonly property var focusedScreen: {
        const name = Hyprland.focusedMonitor?.name
        return Quickshell.screens.find(s => s.name === name)
            ?? (Quickshell.screens.length > 0 ? Quickshell.screens[0] : null)
    }

    Bar { focusedScreen: root.focusedScreen }
    Volume { focusedScreen: root.focusedScreen }
}
