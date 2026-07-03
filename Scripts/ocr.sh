#!/usr/bin/env bash
# Usage: ./ocr.sh <language>

language="$1"
cd "$HOME/.cache" || exit 1

area="$(slurp -b 00000060 -c ffffff)" || exit 1
grim -g "$area" screen-ocr.png || exit 1

tesseract screen-ocr.png screen-ocr -l "${language:-eng}"; status=$?

if [[ $language == "jpn" || $language == "jpn_vert" ]]
    then sed 's/ //g' screen-ocr.txt | wl-copy
    else wl-copy < screen-ocr.txt
fi

rm screen-ocr.png screen-ocr.txt
exit $status
