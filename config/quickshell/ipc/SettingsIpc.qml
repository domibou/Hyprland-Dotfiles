import Quickshell
import Quickshell.Io

Scope {
    required property var settingsLoader
            
    IpcHandler {
        target: "settings"   

        function open() {
            settingsLoader.active = true
        }
    }
}