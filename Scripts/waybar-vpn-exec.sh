#!/usr/bin/env bash

sleep 0.5

name="$(nmcli connection show --active | sed -nr 's/^(.*) +[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12} +wireguard.*$/\1/p' | xargs)"

if [ -n "$name" ]
  then echo "{\"tooltip\":\"$name\",\"text\":\"\"}"
  else echo "{\"tooltip\":\"Wireguard disconnected\",\"text\":\"\"}"
fi
