import Quickshell.Services.SystemTray
import QtQuick
import qs.services
import qs.utils

Repeater {
    model: {
        const items = [...SystemTray.items.values]; // qmllint disable missing-property

        return items.sort((left, right) => {
            const leftOrder = overrides[left.id]?.order ?? 0;
            const rightOrder = overrides[right.id]?.order ?? 0;
            return leftOrder - rightOrder;
        });
    }

    readonly property var overrides: {
        "steam": {
            order: 1,
            icon: Icons.assetIconUrl("steam"),
            iconSize: 15,
            iconOpacity: 0.75
        },
        "vesktop_status_icon_1": {
            order: 2,
            icon: Icons.assetIconUrl("discord"),
            iconSize: 15,
            iconOpacity: 0.75
        },
        "parla": {
            order: 3,
            icon: Icons.assetIconUrl("mail"),
            iconSize: 12,
            iconOpacity: 0.75
        },
        "Fcitx": {
            order: 4
        }
    }

    BarButton {
        icon: overrides[modelData.id]?.icon ?? modelData.icon
        iconSize: overrides[modelData.id]?.iconSize ?? 15
        fgOpacity: overrides[modelData.id]?.iconOpacity ?? 1
        onMainAction: modelData.activate()
        onSecondaryAction: MenuService.showMenu(modelData.menu) // qmllint disable unresolved-type

        required property SystemTrayItem modelData
    }
}
