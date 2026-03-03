#!/bin/sh

color="$(niri msg pick-color | sed -ne 's/Hex: //p')"
[ -n "$color" ] && wl-copy "$color"
