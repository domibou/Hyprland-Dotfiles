import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import "../../../"
import "../../../services"

GridView {
    id: grid

    property int columns: 4
    property real spacing: 20
    property real imageWidth: 200
    property real imageHeight: 150
    property real imageRadius: 20

    Component.onCompleted: {
        forceActiveFocus()
        WallpaperService.getWallpapers()
    }

    clip: true
    focus: true

    keyNavigationEnabled: true

    highlightFollowsCurrentItem: true
    highlightMoveDuration: 200

    highlight: Rectangle {
        color: "transparent"
        border.width: 5
        border.color: Colors.accent

        radius: grid.imageRadius + spacing * 0.5
    }

    cellWidth: imageWidth + spacing
    cellHeight: imageHeight + spacing

    Layout.preferredWidth: columns * cellWidth
    Layout.preferredHeight: 350
    Layout.alignment: Qt.AlignHCenter

    model: WallpaperService.wallpapers
    delegate: Item {
        required property var modelData

        width: grid.cellWidth
        height: grid.cellHeight

        Image {
            id: sourceImage

            visible: false

            source: "file://" + modelData.path
            asynchronous: true
            fillMode: Image.PreserveAspectCrop

            sourceSize.width: grid.imageWidth * 2
            sourceSize.height: grid.imageHeight * 2
        }

        Rectangle {
            id: roundMask

            anchors.fill: parent
            visible: false

            radius: grid.imageRadius
            antialiasing: true

            layer.enabled: true
            layer.smooth: true
        }

        MultiEffect {
            id: roundedImage

            anchors.centerIn: parent

            width: grid.imageWidth
            height: grid.imageHeight

            source: sourceImage

            maskEnabled: true
            maskSource: roundMask

            maskThresholdMin: 0.8
            maskSpreadAtMin: 0.8
        }

        MultiEffect {
            anchors.fill: roundedImage

            source: roundedImage

            shadowEnabled: true
            shadowColor: Colors.black
            shadowBlur: 0.5
            shadowVerticalOffset: 5
        }
    }

    Keys.onReturnPressed: {
        if (currentItem) WallpaperService.setWallpaper(currentItem.modelData.path) 
    }

    function foundWallpapers() {
        return WallpaperService.wallpapers.length !== 0
    }
}