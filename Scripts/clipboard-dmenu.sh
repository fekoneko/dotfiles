#!/usr/bin/env bash

pidof wofi && exit 0

result="$(cliphist -preview-width 40 list | \
  wofi --show dmenu --prompt 'Clipboard' --cache-file '/dev/null' | \
  cliphist decode)" || exit 0

wl-copy "$result"
