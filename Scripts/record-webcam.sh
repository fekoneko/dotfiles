#!/bin/sh

source="/dev/video0"
filename=$(date '+%F_%T.mp4')

ffmpeg \
    -f v4l2 -pixel_format mjpeg \
    -i "$source" "$HOME/Videos/$filename" \
    -f matroska -c copy - \
    | ffplay -
