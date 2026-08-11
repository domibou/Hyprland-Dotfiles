import QtQuick

import "../.."


Rectangle {
    implicitWidth: dataContainer.implicitWidth + Config.widgetWidthPadding
    implicitHeight: Config.widgetHeight
    
    radius: Config.widgetRadius
    color: defaultColor

    readonly property bool hovered: hoverHandler.hovered
    property bool clickable: false
    readonly property color defaultColor: clickable ? (hoverHandler.hovered ? Colors.widgetHover : Colors.widget) : Colors.widget
    property alias content: dataContainer.data

    Item {
        id: dataContainer

        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height

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