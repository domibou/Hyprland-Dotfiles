pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    property var wallpapers: []

    function getWallpapers() {
        getWallpapersProcess.running = true
    }

    function setWallpaper(path) {
        matugenProcess.command = ["matugen", "image", path, "--source-color-index", "0"]
        awwwProcess.command = ["awww", "img", path, "--transition-type", "wipe", "--transition-fps", "165", "--transition-duration", "1"]

        matugenProcess.running = true
        awwwProcess.running = true
    }

    Process {
        id: getWallpapersProcess

        command: ["fd", "-e", "jpg", "-e", "jpeg", "-e", "png", "-e", "webp", "-e", "avif", ".", Quickshell.env("HOME") + "/.dotfiles/wallpapers"]

        stdout: StdioCollector {
            onStreamFinished: {
                wallpapers = text
                    .trim()
                    .split("\n")
                    .filter(line => line.length > 0)
                    .map(path => ({
                        name: path.split("/").pop(),
                        path: path
                    }))
            }
        }
    }

    Process {
        id: matugenProcess
    }

    Process {
        id: awwwProcess
    }
}