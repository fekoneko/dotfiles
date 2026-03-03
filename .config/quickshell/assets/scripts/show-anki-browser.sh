#!/usr/bin/env bash
# Use Anki Connect to show Anki browser GUI
# Usage: show-anki-browser.py [<query>]

query="$1"
retries=0
body='{"action":"guiBrowse","version":5,"params":{"query":"'"${query//\"/\\\"}"'"}}'

# Send request to Anki Connect
while ! curl localhost:8765 -X POST -d "$body" && (( retries < 10 )); do
    # Try starting Anki if it's the first attempt
    (( retries == 0 )) && nohup anki &> /dev/null &

    # Wait a bit and try again
    (( retries++ ))
    sleep 1
done
