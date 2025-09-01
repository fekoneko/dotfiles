#!/bin/sh

# This NetworkManager dispatcher needs to be added to update widget status
# /etc/NetworkManager/dispatcher.d/vpn-waybar.sh
#
#   #!/bin/sh
#   action="$2"
#   if [ "$action" = 'down' ] || [ "$action" = 'up' ]; then
#     killall -USR1 waybar-vpn-exec.sh
#   fi

sleep_pid=''

update() {
  kill "$sleep_pid" 2>/dev/null

  name="$(\
    nmcli connection show --active | \
    sed -nr 's/^(.*) +[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12} +wireguard.*$/\1/p' | \
    xargs\
  )"

  if [ -n "$name" ]
    then echo "{\"tooltip\":\"$name\",\"text\":\"\"}"
    else echo "{\"tooltip\":\"Wireguard disconnected\",\"text\":\"\"}"
  fi
}

update
trap update USR1

# Wait in background, not consuming CPU
while :; do
  sleep infinity & sleep_pid="$!"
  wait "$sleep_pid"
done
