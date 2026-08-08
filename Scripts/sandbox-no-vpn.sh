#!/usr/bin/env bash
# Use firejail to execute a command in a sandbox with the default network
# interface and gateway which should bypass Wireguard if it's enabled.
# May cause some problems with capabilities if not running as root.

routes="$(ip route list)"
device="$(sed -n 's/.*default via [^ ]* dev \([^ ]*\).*/\1/p' <<< "$routes")"
gateway="$(sed -n 's/.*default via \([^ ]*\) dev [^ ]* .*/\1/p' <<< "$routes")"

[ -z "$device" ] || [ -z "$gateway" ] && {
    echo "Cannot determine default interface or gateway"
    exit 1
}

firejail --noprofile --net="$device" --defaultgw="$gateway" "$@"
