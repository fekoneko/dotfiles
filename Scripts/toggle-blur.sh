#!/usr/bin/env bash
# Usage: ./toggle-blur.sh

BLUR_STATE_PATH="$HOME/.config/niri/blur-state.kdl"

if grep -q 'blur true' "$BLUR_STATE_PATH"
    then enabled=false
    else enabled=true
fi

cat > "$BLUR_STATE_PATH" << EOF
window-rule {
    background-effect {
        blur $enabled
    }
}
EOF
