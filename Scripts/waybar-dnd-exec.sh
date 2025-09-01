#!/bin/sh

sleep_pid=''

update() {
  kill "$sleep_pid" 2>/dev/null

  if makoctl mode | grep -q '^do-not-disturb$'; then
    text='󰂛'
    tooltip='Do Not Disturb enabled'
  else
    text='󰂚'
    tooltip='Do Not Disturb disabled'
  fi

  echo "{\"text\":\"$text\",\"tooltip\":\"$tooltip\"}"
}

update
trap update USR1

# Wait in background, not consuming CPU
while :; do
  sleep infinity & sleep_pid="$!"
  wait "$sleep_pid"
done
