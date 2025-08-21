#!/bin/sh

wf_recorder_pid="$(pgrep wf-recorder)"
if [ -n "$wf_recorder_pid" ]
	then echo '{"text":"","tooltip":"Stop recording"}'
	else echo '{"text":"󰻂","tooltip":"Record the screen"}'
fi
