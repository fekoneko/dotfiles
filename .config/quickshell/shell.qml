import Quickshell
import qs.modules.bar
import qs.modules.floatingBar
import qs.modules.overlay

Variants {
    model: Quickshell.screens

    Scope {
        id: barScope
        required property ShellScreen modelData

        Bar {
            id: barWindow
            screen: barScope.modelData
        }

        FloatingBar {
            id: floatingBarWindow
            screen: barScope.modelData
        }

        Overlay {
            id: overlayWindow
            screen: barScope.modelData
        }
    }
}
