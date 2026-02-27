pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    readonly property string volume: Math.round((Pipewire.defaultAudioSink?.audio.volume ?? 0) * 100) + "%"
    readonly property bool volumeMuted: Pipewire.defaultAudioSink?.audio.muted ?? false

    readonly property string volumeIcon: {
        const sink = Pipewire.defaultAudioSink;
        let iconPath;
        if (!sink || sink.audio.muted) {
            iconPath = "assets/icons/volume-muted.svg";
        } else if (sink.audio.volume <= 1 / 3) {
            iconPath = "assets/icons/volume-low.svg";
        } else if (sink.audio.volume <= 2 / 3) {
            iconPath = "assets/icons/volume-medium.svg";
        } else if (sink.audio.volume <= 1) {
            iconPath = "assets/icons/volume-high.svg";
        } else {
            iconPath = "assets/icons/volume-overamplified.svg";
        }
        return "file://" + Quickshell.shellPath(iconPath);
    }

    readonly property string microphoneIcon: {
        const source = Pipewire.defaultAudioSource;
        let iconPath;
        if (!source || source.audio.muted) {
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
