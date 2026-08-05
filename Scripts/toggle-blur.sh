#!/usr/bin/env bash
# Usage: ./toggle-blur.sh

BLUR_STATE_PATH="$HOME/.config/niri/toggle-blur.kdl"

if grep -q 'blur true' "$BLUR_STATE_PATH"
    then enabled=false
    else enabled=true
fi

cat > "$BLUR_STATE_PATH" << EOF
// This file is generated with ~/Scripts/toggle-blur.sh
// and is used to toggle blur behind transparent windows

window-rule {
    background-effect {
        blur $enabled
    }
}
EOF
