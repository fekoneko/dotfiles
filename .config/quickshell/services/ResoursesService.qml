pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real cpuUsage: 0
    property real memoryUsage: 0
    readonly property string formattedCpuUsage: Math.round(cpuUsage) + "%"
    readonly property string formattedMemoryUsage: Math.round(memoryUsage) + "%"

    FileView {
        id: statFile
        path: "/proc/stat"

        property var previousCpuStats: null

        onTextChanged: {
            const cpuLine = text().match(/^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/);
            if (!cpuLine)
                return;

            // Logic taken from https://github.com/snowarch/iNiR

            const stats = cpuLine.slice(1).map(s => Number.parseInt(s));
            const total = stats.reduce((a, b) => a + b, 0);
            const idle = stats[3] + stats[4];

            if (previousCpuStats) {
                const totalDiff = total - previousCpuStats.total;
                const idleDiff = idle - previousCpuStats.idle;
                root.cpuUsage = totalDiff > 0 ? 100 - (idleDiff * 100 / totalDiff) : 0;
            }

            previousCpuStats = {
                total,
                idle
            };
        }
    }

    FileView {
        id: meminfoFile
        path: "/proc/meminfo"

        onTextChanged: {
            const readText = text();
            const totalMemory = Number.parseInt(readText.match(/MemTotal: *(\d+)/)?.[1] ?? 0);
            const availavleMemory = Number.parseInt(readText.match(/MemAvailable: *(\d+)/)?.[1] ?? 0);
            root.memoryUsage = totalMemory > 0 ? (totalMemory - availavleMemory) * 100 / totalMemory : 0;
        }
    }

    Timer {
        interval: 10_000
        repeat: true
        running: true

        onTriggered: {
            meminfoFile.reload();
            statFile.reload();
        }
    }
}
