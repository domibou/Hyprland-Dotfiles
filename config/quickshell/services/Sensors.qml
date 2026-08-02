pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQml


Singleton {
    readonly property var sink: Pipewire.defaultAudioSink

    property real cpuTemp: NaN
    readonly property bool cpuTempHigh: cpuTemp >= 80 && !cpuTempCritical
    readonly property bool cpuTempCritical: cpuTemp >= 100

    property real gpuTemp: NaN
    readonly property bool gpuTempHigh: gpuTemp >= 80 && !gpuTempCritical
    readonly property bool gpuTempCritical: gpuTemp >= 84

    Timer {
        interval: 2000
        repeat: true
        running: true

        onTriggered: {
            getCpuTemp.running = true
            getGpuTemp.running = true
        }
    }

    Process {
        id: getCpuTemp
        command: ["sensors", "-j"]

        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    const data = JSON.parse(text)
                    cpuTemp = data["coretemp-isa-0000"]["Package id 0"].temp1_input
                } 
                catch (e) {
                    cpuTemp = undefined
                }
            }
        }
    }

    Process {
        id: getGpuTemp
        command: ["nvidia-smi", "--query-gpu=temperature.gpu", "--format=csv,noheader,nounits"]

        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    gpuTemp = parseInt(text.trim())
                }
                catch (e) {
                    gpuTemp = undefined
                }
            }
        }
    }
}