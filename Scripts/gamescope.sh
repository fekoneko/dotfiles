#!/bin/sh

screen_width="${WIDTH:-1920}"
screen_height="${HEIGHT:-1200}"

exec systemd-inhibit gamescope \
  --fullscreen \
  --nested-width "$screen_width" \
  --nested-height "$screen_height" \
  --output-width "$screen_width" \
  --output-height "$screen_height" \
  --force-grab-cursor \
  --mouse-sensitivity 2 \
  --cursor-scale-height "$screen_height" \
  --expose-wayland \
  -- "$@"
