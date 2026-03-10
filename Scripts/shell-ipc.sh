#!/usr/bin/env bash
# Usage: ./shell-ipc.sh <action>
# Actions: collapse_bar, expand_bar, toggle_bar

action="$1"
socket_path="${QUICKSHELL_SOCKET:-/run/user/1000/quickshell.sock}"

case $action in
  collapse_bar) ncat -U "$socket_path" <<< '{ "action": "collapse_bar" }' ;;
  expand_bar)   ncat -U "$socket_path" <<< '{ "action": "expand_bar" }'   ;;
  toggle_bar)   ncat -U "$socket_path" <<< '{ "action": "toggle_bar" }'   ;;
  '')           echo "No action specified" >&2; exit 1 ;;
  *)            echo "Invalid action: $action" >&2; exit 1 ;;
esac
