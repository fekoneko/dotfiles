pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    readonly property string volume: Math.round(Pipewire.defaultAudioSink.audio.volume * 100) + "%"

    readonly property string icon: {
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

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
}
