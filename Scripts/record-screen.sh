#!/bin/sh

options="$(niri msg outputs | sed -n 's/^Output "\(.*\)" (\(.*\))$/\2     (\1)/p')" || exit 1

if [ "$(printf '%s\n' "$options" | wc -l)" -gt 1 ]
	then selected_option="$(printf '%s' "$options" | walker --dmenu)" || exit 1
	else selected_option="$options"
fi
[ -z "$selected_option" ] && exit 1

output="$(printf '%s' "$selected_option" | sed -n 's/     (.*)$//p')"
filename=$(date '+%F_%T.mp4')

wf-recorder \
	--audio \
	--codec h264_vaapi \
	--file "$HOME/Videos/$filename" \
	--output "$output" >/dev/null 2>&1 &
