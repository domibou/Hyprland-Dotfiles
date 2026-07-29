import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

import "../services"

Rectangle {
    width: 100
    height: 40
    radius: 22

    Text {
        anchors.centerIn: parent

        text: Time.time

        font {
            family: "JetBrainsMono Nerd Font"
            pixelSize: 16
            weight: 500
        }
    }
}