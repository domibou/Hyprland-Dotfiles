import QtQuick

import "../.."
import "../../../.."


Rectangle {
    implicitWidth: container.childrenRect.width + Config.widgetWidthPadding
    implicitHeight: Config.barHeight - 2 * Config.widgetMargin
    radius: height / 2

    color: colorOverride ? colorOverride : colorDefault

    readonly property bool hovered: hoverHandler.hovered

    property color colorDefault: hoverHandler.hovered ? Colors.backgroundHover : Colors.background
    property var colorOverride: undefined

    property alias content: container.data

    Item {
        id: container
        anchors.centerIn: parent
    }

    HoverHandler {
        id: hoverHandler
    }

    Behavior on color {
        ColorAnimation { duration: Config.widgetHoverAnimationDuration }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 250
            easing.type: Easing.OutCubic
        }
    }
}