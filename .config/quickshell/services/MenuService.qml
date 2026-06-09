pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    QsMenuOpener {
        id: menuOpener

        onChildrenChanged: dmenuProcess.writeEntries()
    }

    Process {
        id: dmenuProcess
        command: ["walker", "--dmenu"]
        stdinEnabled: true

        onStarted: writeEntries()

        stdout: SplitParser {
            onRead: line => {
                const entry = menuOpener.children.values.find(entry => entry.text === line);
                entry?.triggered();
            }
        }

        function writeEntries(): void {
            const entries = menuOpener.children.values.filter(entry => !entry.isSeparator).map(entry => entry.text);

            if (entries.length > 0) {
                write(entries.join("\n"));
                stdinEnabled = false;
                stdinEnabled = true;
            }
        }
    }

    function showMenu(menu: QsMenuHandle): void {
        console.log(menu);
        menuOpener.menu = menu;
        dmenuProcess.running = true;
    }
}
