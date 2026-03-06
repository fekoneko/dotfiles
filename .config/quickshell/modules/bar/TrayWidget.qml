import Quickshell
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick

Repeater {
    model: SystemTray.items

    BarButton {
        id: barButton
        icon: modelData.icon
        iconSize: 15
        onMainAction: modelData.activate()
        onSecondaryAction: dmenuProcess.running = true

        required property SystemTrayItem modelData

        QsMenuOpener {
            id: menuOpener
            menu: barButton.modelData.menu // qmllint disable unresolved-type
        }

        Process {
            id: dmenuProcess
            command: ["walker", "--dmenu"]
            stdinEnabled: true

            onStarted: {
                const entries = menuOpener.children.values.filter(entry => !entry.isSeparator).map(entry => entry.text);
                write(entries.join("\n"));
                stdinEnabled = false;
                stdinEnabled = true;
            }

            stdout: SplitParser {
                onRead: line => {
                    const entry = menuOpener.children.values.find(entry => entry.text === line);
                    entry?.triggered();
                }
            }
        }
    }
}
