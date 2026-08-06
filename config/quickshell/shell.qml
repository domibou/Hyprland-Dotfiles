import Quickshell
import QtQuick
import QtQuick.Layouts

import "windows/bar"
import "windows/volume"
import "windows/launcher"

ShellRoot {
  Variants {
    model: Quickshell.screens

    Bar{
      property var modelData
      screen: modelData
    }
  }

  Volume {}
  Launcher {}
}