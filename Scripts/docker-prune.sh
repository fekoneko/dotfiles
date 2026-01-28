#!/usr/bin/env bash

read -rp 'Are you sure you want to nuke all docker data? [y/N] ' ok
case $ok in y|Y);; *) exit 0;; esac

mapfile -rd ' ' containers < <(docker ps -a -q)
[[ ${#containers[@]} != 0 ]] && docker kill "${containers[@]}"

yes | docker system prune -a
yes | docker volume prune -a
