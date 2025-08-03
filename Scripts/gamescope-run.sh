#!/usr/bin/env bash

screen_width=1920
screen_height=1200
cursor_path="$HOME/.local/share/icons/gamescope-cursor"

# shellcheck disable=SC2068
gamescope \
  --fullscreen \
  --nested-width "$screen_width" \
  --nested-height "$screen_height" \
  --output-width "$screen_width" \
  --output-height "$screen_height" \
  --cursor "$cursor_path" \
  --force-grab-cursor \
  --expose-wayland \
  -- $@
