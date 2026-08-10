pragma Singleton

import Quickshell
import Quickshell.Io
import QtQml

import "../"


Singleton {
    property real temperature: NaN
    property real humidity: NaN

    readonly property real latitude: Config.weatherWidgetLatitude
    readonly property real longitude: Config.weatherWidgetLongitude

    // 15 min
    readonly property int updateInterval: 900000

    Component.onCompleted: {
        process.running = true
    }

    Process {
        id: process

        command: [
            "curl",
            "-s",
            `https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current=temperature_2m,relative_humidity_2m`
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    const data = JSON.parse(text)
                    temperature = data.current.temperature_2m
                    humidity = data.current.relative_humidity_2m
                } catch (e) {
                    temperature = NaN
                    humidity = NaN
                }
            }
        }
    }

    Timer {
        interval: updateInterval
        repeat: true
        running: true

        onTriggered: process.running = true
    }
}
