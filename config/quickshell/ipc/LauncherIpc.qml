import Quickshell
import Quickshell.Io

Scope {
    required property var launcherLoader
            
    IpcHandler {
        target: "launcher"   

        function open() {
            launcherLoader.active = true
        }
    }
}