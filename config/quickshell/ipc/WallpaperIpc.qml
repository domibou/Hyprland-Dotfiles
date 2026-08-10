import Quickshell
import Quickshell.Io

Scope {
    required property var wallpaperLoader
            
    IpcHandler {
        target: "wallpaper"   

        function open() {
            wallpaperLoader.active = true
        }

        function close() {
            wallpaperLoader.active = false
        }
    }
}