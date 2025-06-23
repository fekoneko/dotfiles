#!/usr/bin/env bash

if [ -z $(pgrep wf-recorder) ]; then
	filename=$(date +%F_%T.mp4)
	if [ "$1" = "--slurp" ]
		then wf-recorder -f "$HOME/Videos/$filename" -g "$(slurp -c "#FFFFFF")" >/dev/null 2>&1 &
		else wf-recorder -f "$HOME/Videos/$filename" >/dev/null 2>&1 &
	fi
else
	killall -s SIGINT wf-recorder || exit 1
	notify-send "Recording stopped"
	while [ -n "$(pgrep -x wf-recorder)" ]; do wait; done
fi
