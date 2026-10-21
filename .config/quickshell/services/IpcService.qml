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
        target: "keymapOverlay"

        // $ quickshell ipc call keymapOverlay show
        function show(): void {
            root.keymapOverlayVisible = true;
        }

        // $ quickshell ipc call keymapOverlay hide
        function hide(): void {
            root.keymapOverlayVisible = false;
        }

        // $ quickshell ipc call keymapOverlay toggle
        function toggle(): void {
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
