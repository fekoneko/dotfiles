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
        let icon = problematicAppIcons.find(entry => entry.appId.test(appId));
        if (icon && typeof icon.icon === "function") {
            icon = icon.icon(...icon.appId.exec(appId));
        } else if (icon) {
            icon = icon.icon;
        } else {
            icon = DesktopEntries.byId(appId)?.icon;
        }
        return Quickshell.iconPath(icon, nothingOrFallbackOrCheck);
    }

    readonly property list<var> problematicAppIcons: [
        {
            appId: /^veracrypt$/,
            icon: "/usr/share/icons/hicolor/128x128/apps/veracrypt.xpm"
        },
        {
            appId: /^com.transmissionbt.transmission/,
            icon: "transmission-gtk"
        },
        {
            appId: /^md.Obsidian$/,
            icon: "obsidian"
        },
        {
            appId: /^evolution-alarm-notify$/,
            icon: "org.gnome.Evolution-alarm-notify"
        },
        {
            appId: /^steam_app_(\d+)$/,
            icon: (_, id) => `steam_icon_${id}`
        },
    ]

    Connections {
        target: DesktopEntries.applications

        function onValuesChanged(): void {
            root.appIconUrlChanged();
        }
    }
}
