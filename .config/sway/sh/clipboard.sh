#!/bin/sh

i_run=~/.config/sway/sh/run.sh

item=$(cliphist list | $i_run 'fuzzel --dmenu --placeholder="<M-0> to clear" --mesg="$RUNNER_SAYING" --counter')
mode=$?

case $mode in
    0)
        echo "$item" | cliphist decode | wl-copy
    ;;
    10)
        echo "$item" | cliphist delete
    ;;
    19)
        cliphist wipe
    ;;
esac
