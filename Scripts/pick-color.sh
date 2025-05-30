#!/usr/bin/env bash

color="$(niri msg pick-color | sed -ne 's/Hex: //p')"

if [[ -n "$color" ]]; then
  wl-copy "$color"
fi
