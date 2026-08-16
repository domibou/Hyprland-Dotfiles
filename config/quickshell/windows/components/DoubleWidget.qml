import QtQuick
import QtQuick.Layouts

import "../../"


Widget {
    property alias leftContent: left.data
    property alias rightContent: right.data

    content: RowLayout {
        id: dataContainer

        spacing: Config.iconSpacing
        
        Item {
            id: left

            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height
        }

        Rectangle {
            implicitWidth: 2
            implicitHeight: parent.height * 0.6

            radius: width / 2
            color: Colors.separator

            Layout.topMargin: 4
            Layout.bottomMargin: 4
        }

        Item {
            id: right

            implicitWidth: childrenRect.width
            implicitHeight: childrenRect.height    
        }
    }
}