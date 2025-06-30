#!/usr/bin/env bash

if [ -z $(pgrep wf-recorder) ]; then
	options="$(niri msg outputs | sed -n 's/^Output "\(.*\)" (\(.*\))$/\2     (\1)/p')" || exit 1
	if [[ $(printf '%s\n' "$options" | wc -l) -gt 1 ]]
		then selected_option="$(printf '%s' "$options" | wofi --show dmenu)" || exit 1
		else selected_option="$options"
	fi

	if [[ -z "$selected_option" ]]; then exit 1; fi
	output="$(printf '%s' "$selected_option" | sed -n 's/     (.*)$//p')"

	filename=$(date +%F_%T.mp4)
	wf-recorder -f "$HOME/Videos/$filename" -o "$output" >/dev/null 2>&1 &
else
	killall -s SIGINT wf-recorder || exit 1
	while [ -n "$(pgrep -x wf-recorder)" ]; do wait; done
	notify-send "Recording stopped"
fi
