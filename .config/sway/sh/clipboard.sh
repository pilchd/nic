#!/bin/sh

~/.config/sway/sh/run.sh
pid=$(< ${XDG_RUNTIME_DIR}/run.pid)
runner=$(< ${XDG_RUNTIME_DIR}/run.ner)

[[ $runner == 0 ]] && prompt="Jambo Nintendo!"
[[ $runner == 1 ]] && prompt="Don't be so silly!"

cliphist list | tofi --font='sans-serif' --prompt-text="$prompt" | ifne cliphist decode | wl-copy

kill $pid
