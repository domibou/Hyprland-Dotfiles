import QtQuick

import "../../"


Rectangle {
    id: groove

    implicitHeight: 32
    implicitWidth: 52

    radius: height / 2
    color: thumb.active ? Colors.primary : Colors.secondary

    Rectangle {
        id: thumb

        property bool active: false
        
        width: groove.width * 0.58
        height: groove.height - 8

        x: active ? groove.width - width - 4 : 4
        anchors.verticalCenter: parent.verticalCenter

        radius: height / 2
        color: hoverHandler.hovered ? Colors.widgetHover : Colors.surface

        Behavior on x {
            NumberAnimation {
                duration: Config.animationDuration
                easing.type: Easing.InOutCubic
            }
        }

        Behavior on color {
            ColorAnimation { duration: Config.widgetHoverAnimationDuration }
        }

        function toggle() {
            active = !active
        }
    }

    HoverHandler {
        id: hoverHandler
    }

    TapHandler {
        onTapped: thumb.toggle()
    }
}