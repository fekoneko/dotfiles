pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    readonly property real volume: (Pipewire.defaultAudioSink?.audio.volume ?? 0) * 100
    readonly property string formattedVolume: Math.round(volume) + "%"
    readonly property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? false
    readonly property bool microphoneMuted: Pipewire.defaultAudioSource?.audio.muted ?? false

    readonly property string volumeIcon: {
        let icon;
        if (muted) {
            icon = "assets/icons/volume-muted.svg";
        } else if (volume <= 100 / 3) {
            icon = "assets/icons/volume-low.svg";
        } else if (volume <= 200 / 3) {
            icon = "assets/icons/volume-medium.svg";
        } else if (volume <= 100) {
            icon = "assets/icons/volume-high.svg";
        } else {
            icon = "assets/icons/volume-overamplified.svg";
        }
        return Quickshell.iconPath(Quickshell.shellPath(icon));
    }

    readonly property string microphoneIcon: {
        let iconPath;
        if (microphoneMuted) {
            iconPath = "assets/icons/microphone-muted.svg";
        } else {
            iconPath = "assets/icons/microphone.svg";
        }
        return Quickshell.iconPath(Quickshell.shellPath(iconPath));
    }

    function toggleVolume(): void {
        const sink = Pipewire.defaultAudioSink;
        if (sink)
            sink.audio.muted = !sink.audio.muted;
    }

    function toggleMicrophone(): void {
        const source = Pipewire.defaultAudioSource;
        if (source)
            source.audio.muted = !source.audio.muted;
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
}
