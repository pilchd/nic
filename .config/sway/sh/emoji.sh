#!/bin/sh

emoji=$(
    cat ~/.local/share/emoji/emoji.txt |
    fuzzel --dmenu --config ~/.config/fuzzel/emoji.ini --accept-nth=1 --nth-delimiter=' '
)
selection=$?

[[ -z $emoji ]] && exit

case $selection in
    0) wtype "$emoji" ;;
    10) wl-copy "$emoji" ;;
esac
