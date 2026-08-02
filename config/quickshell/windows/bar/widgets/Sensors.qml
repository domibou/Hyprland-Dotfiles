import QtQuick
import QtQuick.Layouts

import "../"
import "../../.."
import "../../../services"
import "components"

Pill {
    id: pill

    content:
        RowLayout {
            id: layout

            anchors.centerIn: parent
            spacing: Config.iconSpacing

            property color cpuColorIndicator: {
                if (isNaN(Sensors.cpuTemp))
                    return Colors.text

                if (Sensors.cpuTempCritical)
                    return Colors.indicatorCritical

                if (Sensors.cpuTempHigh)
                    return Colors.indicatorHigh

                return Colors.text
            }

            property color gpuColorIndicator: {
                if (isNaN(Sensors.gpuTemp))
                    return Colors.text

                if (Sensors.gpuTempCritical)
                    return Colors.indicatorCritical

                if (Sensors.gpuTempHigh)
                    return Colors.indicatorHigh

                return Colors.text
            }

            Text {
                text: ""

                color: Colors.text

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.iconSize
                }
            }

            Text {
                text: "CPU " + (isNaN(Sensors.cpuTemp) ? "-" : `${Sensors.cpuTemp}°C`)

                color: layout.cpuColorIndicator

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }
            }

            Rectangle {
                implicitWidth: 2
                implicitHeight: parent.height * 0.6

                color: Colors.widgetContainer

                Layout.topMargin: 4
                Layout.bottomMargin: 4
            }

            Text {
                text: "GPU " + (isNaN(Sensors.gpuTemp) ? "-" : `${Sensors.gpuTemp}°C`)

                color: layout.gpuColorIndicator

                font {
                    family: Config.textFontFamily
                    pixelSize: Config.textSize
                    weight: Config.textWeight
                }
            }
        }
}