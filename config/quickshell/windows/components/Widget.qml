import QtQuick

import "../.."
import "../../../.."


Rectangle {
    implicitWidth: container.childrenRect.width + Config.widgetWidthPadding
    implicitHeight: Config.widgetContainerHeight - 2 * Config.widgetMargin
    radius: height / 2

    color: colorOverride ? colorOverride : colorDefault

    readonly property bool hovered: hoverHandler.hovered

    property bool clickable: false
    property color colorDefault: clickable ? (hoverHandler.hovered ? Colors.widgetHover : Colors.widget) : Colors.widget
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