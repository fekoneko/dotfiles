pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import qs.utils

Singleton {
    readonly property real volume: (Pipewire.defaultAudioSink?.audio.volume ?? 0) * 100
    readonly property string formattedVolume: Math.round(volume) + "%"
    readonly property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? false
    readonly property bool microphoneMuted: Pipewire.defaultAudioSource?.audio.muted ?? false

    readonly property string volumeIcon: {
        if (muted)
            return Icons.assetIconUrl("volume-muted");
        else if (volume <= 100 / 3)
            return Icons.assetIconUrl("volume-low");
        else if (volume <= 200 / 3)
            return Icons.assetIconUrl("volume-medium");
        else if (volume <= 100)
            return Icons.assetIconUrl("volume-high");
        else
            return Icons.assetIconUrl("volume-overamplified");
    }

    readonly property string microphoneIcon: {
        if (microphoneMuted)
            return Icons.assetIconUrl("microphone-muted");
        else
            return Icons.assetIconUrl("microphone");
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
