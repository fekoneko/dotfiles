#!/usr/bin/env bash

name="$(nmcli connection show --active | sed -nr 's/^(.*) +[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12} +wireguard.*$/\1/p' | xargs)"

if [ -n "$name" ]
  then nmcli connection down "$name"
  else nmcli connection up 'fekoneko VPS'
fi
