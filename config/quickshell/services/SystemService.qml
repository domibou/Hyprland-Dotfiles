pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    property bool showOptions: false

    function toggleMode() {
        showOptions = !showOptions
    }

    function shutdown() {
        process.command = ["shutdown", "now"]

        process.running = true
    }

    function reboot() {
        process.command = ["reboot"]

        process.running = true
    }

    Process {
        id: process
    }
}