#!/usr/bin/env bash
# Set IPs ignored by all Wireguard NetworkManager connections (edits AllowedIPs)
# Usage: set-wg-ignored-ips.sh

# Wait for any input and exit the program
# Usage: panic
panic() {
    read -rep 'Enter anything to exit...'
    exit 1
}

TEMPLATE_FILE="${XDG_DATA_HOME:-$HOME/.local/share}/wg-ignored-ips-template.txt"

connections=$(nmcli --fields TYPE,UUID,NAME connection show) || panic
wg_connection_uuids="$(sed -n 's/^wireguard *\([^ ]*\) .*$/\1/p' <<< "$connections")"
wg_connection_names="$(sed -n 's/^wireguard *[^ ]* *\(.*\)$/\1/p' <<< "$connections")"

"${EDITOR:-nano}" "$TEMPLATE_FILE" || panic
[[ ! -f "$TEMPLATE_FILE" ]] && panic

reverse_ips_script="$(dirname "$0")/reverse-wg-allowed-ips.py"
allowed_ips="$("$reverse_ips_script" "$(cat "$TEMPLATE_FILE")")" || panic

echo "AllowedIPs will be modified for these NetworkManager connections:"
echo "$wg_connection_names"
echo
echo "AllowedIPs:"
echo "$allowed_ips"
echo

for uuid in $wg_connection_uuids; do
    peers="$(sudo nmcli --show-secrets --fields wireguard.peers \
        connection show "$uuid" \
        | sed 's/^wireguard.peers: *//' \
        | sed "s|allowed-ips=[^ ]*|allowed-ips=$allowed_ips|g"
    )" || panic

    # Private key resets after modifying wireguard.peers so we need to remember it
    private_key="$(sudo nmcli --show-secrets --fields wireguard.private-key \
        connection show "$uuid" \
        | sed 's/^wireguard.private-key: *//'
    )" || panic

    sudo nmcli connection modify "$uuid" \
        wireguard.peers "$peers" \
        wireguard.private-key "$private_key" \
        || panic
done
