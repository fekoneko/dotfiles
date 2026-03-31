pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    // Resolve icon asset path without file:// protocol prefix.
    function assetIconPath(icon: string): string {
        return Quickshell.shellPath("assets/icons/" + icon + ".svg");
    }

    // Resolve icon asset URL. Contains file:// protocol prefix - ready to be used in Image source field.
    function assetIconUrl(icon: string, nothingOrFallbackOrCheck: var): string {
        return Quickshell.iconPath(assetIconPath(icon), nothingOrFallbackOrCheck);
    }

    // Resolve app icon URL. Contains file:// protocol prefix - ready to be used in Image source field.
    // Will automatically bind to DesktopEntries.applications.values changes.
    readonly property var appIconUrl: (appId, nothingOrFallbackOrCheck) => {
        let icon = problematicAppIcons.find(entry => entry.appId.test(appId))?.icon;
        icon = icon || DesktopEntries.byId(appId)?.icon;
        return Quickshell.iconPath(icon, nothingOrFallbackOrCheck);
    }

    readonly property list<var> problematicAppIcons: [
        {
            appId: /^org.kde.krita$/,
            icon: "org.kde.krita"
        },
        {
            appId: /^veracrypt$/,
            icon: "veracrypt"
        },
        {
            appId: /^com.transmissionbt.transmission/,
            icon: "transmission-gtk"
        },
        {
            appId: /^evolution-alarm-notify$/,
            icon: "org.gnome.Evolution-alarm-notify"
        },
    ]

    Connections {
        target: DesktopEntries.applications

        function onValuesChanged(): void {
            root.appIconUrlChanged();
        }
    }
}
