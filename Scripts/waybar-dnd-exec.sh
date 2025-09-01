#!/bin/sh

update() {
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
while :; do sleep infinity & wait $!; done
