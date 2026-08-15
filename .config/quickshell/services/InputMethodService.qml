pragma Singleton

import Quickshell
import qs.services

Singleton {
    readonly property string imGroup: {
        switch (NiriService.keyboardLayout) {
        case 0:
            return "English";
        case 1:
            return "Russian";
        case 2:
            return "Japanese";
        }
    }

    onImGroupChanged: {
        Quickshell.execDetached(["fcitx5-remote", "-g", imGroup]);
    }
}
