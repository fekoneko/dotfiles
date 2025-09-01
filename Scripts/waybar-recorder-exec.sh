#!/bin/sh

sleep_pid=''
cleanup() {
  kill "$sleep_pid" 2>/dev/null
}

update() {
	cleanup

	wf_recorder_pid="$(pgrep wf-recorder)"
	if [ -n "$wf_recorder_pid" ]
		then echo '{"text":"","tooltip":"Stop recording"}'
		else echo '{"text":"󰻂","tooltip":"Record the screen"}'
	fi
}

update
trap update USR1
trap cleanup EXIT

# Wait in background, not consuming CPU
while :; do
  sleep infinity & sleep_pid="$!"
  wait "$sleep_pid"
done

