#!/bin/sh

makoctl mode -t do-not-disturb
killall -USR1 waybar-dnd-exec.sh
