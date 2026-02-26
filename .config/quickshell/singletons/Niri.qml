pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  readonly property string socketPath: Quickshell.env("NIRI_SOCKET")
  property var windowIdToTitle: new Map()
  property var focusedWindow: null

  Socket {
    id: eventsSocket
    path: socketPath
    connected: true

    onConnectionStateChanged: {
      if (connected) {
        console.log(`Niri: Connected to events socket: ${socketPath}`);
        send(eventsSocket, "EventStream");
      } else {
        console.warn(`Niri: Disconnected from events socket: ${socketPath}`);
      }
    }

    parser: SplitParser {
      onRead: (line) => {
        try {
          console.log(`Niri: Received event: ${line}`);
          const event = JSON.parse(line);
          eventsSocket.handleEvent(event);
        } catch (error) {
          console.warn(`Niri: Failed to parse event: ${line}: ${error}`);
        }
      }
    }

    function handleEvent(event) {
      const eventType = Object.keys(event)[0];
      event = event[eventType];

      switch (eventType) {
        case "WindowsChanged":
          windowIdToTitle = new Map();
          for (const window of event.windows) {
            windowIdToTitle.set(window.id, window.title);
            maybeSetFocusedWindow(window);
          }
          break;

        case "WindowFocusChanged":
          setFocusedWindowById(event.id);
          break;

        case "WindowOpenedOrChanged":
          windowIdToTitle.set(event.window.id, event.window.title);
          maybeSetFocusedWindow(event.window) || updateFocusedWindow();
          break;

        case "WindowClosed":
          windowIdToTitle.delete(event.id);
          updateFocusedWindow();
          break;
      }
    }
  }

  function send(socket, data) {
    const message = JSON.stringify(data) + "\n";
    socket.write(message);
    socket.flush();
  }

  function setFocusedWindowById(id) {
    const title = windowIdToTitle.get(id);
    if (title) focusedWindow = { id, title };
    else focusedWindow = null;
  }

  function maybeSetFocusedWindow(window) {
    const { id, title, is_focused } = window;
    if (is_focused) focusedWindow = { id, title };
    return is_focused;
  }

  function updateFocusedWindow() {
    if (focusedWindow) setFocusedWindowById(focusedWindow.id);
  }
}
