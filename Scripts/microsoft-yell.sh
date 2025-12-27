#!/usr/bin/env bash

dir_path="$(dirname "$(realpath "$0")")"
sound_index=$((RANDOM % 4))

mpv --no-video "$dir_path/microsoft-yell-sounds/$sound_index.mp3"
