pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property string randomWord: ""

    Process {
        id: randomWordProcess
        command: ["sh", "-c", Quickshell.shellPath("assets/scripts/random-anki-word.py")]
        running: true

        stdout: SplitParser {
            onRead: line => root.randomWord = line
        }

        onExited: exitCode => { // qmllint disable signal-handler-parameters
            if (exitCode !== 0)
                console.warn(`Anki: random-anki-word.py exited with code ${exitCode}`);
        }
    }

    Timer {
        id: randomWordTimer
        interval: 3_600_000
        repeat: true
        running: true
        onTriggered: randomWordProcess.running = true
    }

    function refreshRandomWord(): void {
        randomWordProcess.running = true;
        randomWordTimer.restart();
    }
}
