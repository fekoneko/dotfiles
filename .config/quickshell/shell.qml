import Quickshell
import qs.modules.bar
import qs.modules.floatingBar

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
    }
}
