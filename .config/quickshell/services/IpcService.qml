pragma Singleton

import Quickshell
import Quickshell.Io
import qs.services

Singleton {
    id: root

    property bool barExpanded: false
    property bool keymapOverlayVisible: false

    IpcHandler {
        target: "bar"

        // $ quickshell ipc call bar expand
        function expand(): void {
            root.barExpanded = true;
        }

        // $ quickshell ipc call bar collapse
        function collapse(): void {
            root.barExpanded = false;
        }

        // $ quickshell ipc call bar toggle
        function toggle(): void {
            root.barExpanded = !root.barExpanded;
        }
    }

    IpcHandler {
        target: "overlay"

        // $ quickshell ipc call overlay showKeymap
        function showKeymap(): void {
            root.keymapOverlayVisible = true;
        }

        // $ quickshell ipc call overlay hideKeymap
        function hideKeymap(): void {
            root.keymapOverlayVisible = false;
        }

        // $ quickshell ipc call overlay toggleKeymap
        function toggleKeymap(): void {
            root.keymapOverlayVisible = !root.keymapOverlayVisible;
        }
    }

    IpcHandler {
        target: "notifications"

        // $ quickshell ipc call notifications clear
        function clear(): void {
            NotificationsService.clear();
        }
    }
}
