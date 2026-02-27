pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    readonly property real volume: Pipewire.defaultAudioSink?.audio.volume ?? 0
    readonly property string formattedVolume: Math.round(volume * 100) + "%"
    readonly property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? false
    readonly property bool microphoneMuted: Pipewire.defaultAudioSource?.audio.muted ?? false

    readonly property string volumeIcon: {
        let iconPath;
        if (!volume) {
            iconPath = "assets/icons/volume-muted.svg";
        } else if (volume <= 1 / 3) {
            iconPath = "assets/icons/volume-low.svg";
        } else if (volume <= 2 / 3) {
            iconPath = "assets/icons/volume-medium.svg";
        } else if (volume <= 1) {
            iconPath = "assets/icons/volume-high.svg";
        } else {
            iconPath = "assets/icons/volume-overamplified.svg";
        }
        return "file://" + Quickshell.shellPath(iconPath);
    }

    readonly property string microphoneIcon: {
        let iconPath;
        if (microphoneMuted) {
            iconPath = "assets/icons/microphone-muted.svg";
        } else {
            iconPath = "assets/icons/microphone.svg";
        }
        return "file://" + Quickshell.shellPath(iconPath);
    }

    function toggleVolume() {
        const sink = Pipewire.defaultAudioSink;
        if (sink)
            sink.audio.muted = !sink.audio.muted;
    }

    function toggleMicrophone() {
        const source = Pipewire.defaultAudioSource;
        if (source)
            source.audio.muted = !source.audio.muted;
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
}
