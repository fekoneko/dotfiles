#!/bin/sh

sleep_pid=''

update() {
	kill "$sleep_pid" 2>/dev/null

	wf_recorder_pid="$(pgrep wf-recorder)"
	if [ -n "$wf_recorder_pid" ]
		then echo '{"text":"","tooltip":"Stop recording"}'
		else echo '{"text":"󰻂","tooltip":"Record the screen"}'
	fi
}

update
trap update USR1

# Wait in background, not consuming CPU
while :; do
  sleep infinity & sleep_pid="$!"
  wait "$sleep_pid"
done

