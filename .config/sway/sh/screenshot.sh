#!/bin/sh

DIR="${HOME}/IOD/Screenshots"
NAME="$(date +Screenshot_%Y%m%d-%H%M%S.png)"

AREA=$1
SAVE=$2

case "$1" in

    "area")
        if [[ $SAVE == 0 ]]; then
            grim -g "$(slurp)" - | wl-copy
        else
            grim -g "$(slurp)" - | tee "${DIR}/${NAME}" | wl-copy
        fi
    ;;

    "active")
        if [[ $SAVE == 0 ]]; then
            grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | wl-copy
        else
            grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | tee "${DIR}/${NAME}" | wl-copy
        fi
    ;;

esac
