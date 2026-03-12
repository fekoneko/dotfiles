pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool barCollapsed: true

    IpcHandler {
        target: "bar"

        // $ quickshell ipc call bar expand
        function expand(): void {
            root.barCollapsed = false;
        }

        // $ quickshell ipc call bar collapse
        function collapse(): void {
            root.barCollapsed = true;
        }

        // $ quickshell ipc call bar toggle
        function toggle(): void {
            root.barCollapsed = !root.barCollapsed;
        }
    }
}
