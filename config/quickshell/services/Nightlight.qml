pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io

Singleton {
    readonly property int defaultTemp: 3500

    readonly property int maxTemp: 6000
    readonly property int minTemp: 2000

    property int temp: defaultTemp
    property bool active: false

    function toggle() {
        if (active) {
            _turnOff()
            active = false
        } 
        else {
            _turnOn()
            active = true
        }        
    }

    function warmer(step = 100) {
        var newTemp = temp - step

        if (newTemp >= minTemp) {
            temp = newTemp
            _setTemp(newTemp)
        } 
    }

    function cooler(step = 100) {
        var newTemp = temp + step

        if (newTemp <= maxTemp) {
            temp = newTemp
            _setTemp(newTemp)
        }
    } 

    function _turnOn() {
        process.command = ["hyprctl", "hyprsunset", "temperature", temp]

        process.running = true
    }

    function _turnOff() {
        process.command = ["hyprctl", "hyprsunset", "identity"]

        process.running = true
    }

    function _setTemp(temp) {
        process.command = ["hyprctl", "hyprsunset", "temperature", temp]

        process.running = true
    }

    Process {
        id: process
    }
}