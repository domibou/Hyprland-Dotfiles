pragma Singleton

import Quickshell

Singleton {
    // Set to Hyprland config option gaps_out from general.lua
    readonly property int gapsOut: 25

    readonly property int widgetContainerMargins: gapsOut
    readonly property int widgetContainerHeight: 60
    
    readonly property int widgetWidthPadding: 30
    readonly property int widgetMargin: 12
    readonly property int widgetHoverAnimationDuration: 75
    readonly property int widgetSpacing: 10

    readonly property int textSize: 20
    readonly property int textWeight: 500
    readonly property string textFontFamily: "JetBrainsMono Nerd Font"

    readonly property int borderWidth: 2

    readonly property int iconSize: 30
    readonly property int iconSpacing: 6
}
