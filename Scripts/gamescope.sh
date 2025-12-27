#!/bin/sh

screen_width="${WIDTH:-1920}"
screen_height="${HEIGHT:-1200}"
cursor_path="$HOME/.local/share/icons/gamescope-cursor"

exec gamescope \
  --fullscreen \
  --nested-width "$screen_width" \
  --nested-height "$screen_height" \
  --output-width "$screen_width" \
  --output-height "$screen_height" \
  --cursor "$cursor_path" \
  --force-grab-cursor \
  --mouse-sensitivity 2.25 \
  --expose-wayland \
  -- "$@"
