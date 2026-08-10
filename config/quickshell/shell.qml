import Quickshell
import QtQuick
import QtQuick.Layouts

import "windows/bar"
import "windows/volume"
import "windows/launcher"
import "windows/wallpaper"
import "ipc"

ShellRoot {
  Variants {
    model: Quickshell.screens

    Bar{
      property var modelData
      screen: modelData
    }
  }

  Volume {}

  Launcher { id: launcher }
  LauncherIpc { launcherLoader: launcher }

  Wallpaper { id: wallpaper }
  WallpaperIpc { wallpaperLoader: wallpaper }
}