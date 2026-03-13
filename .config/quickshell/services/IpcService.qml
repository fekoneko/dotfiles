pragma Singleton

import Quickshell
import Quickshell.Io
import qs.services

Singleton {
    id: root

    property bool barExpanded: false

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
        target: "notifications"

        // $ quickshell ipc call notifications clear
        function clear(): void {
            NotificationsService.clear();
        }
    }
}
