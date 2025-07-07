if command -v sway &> /dev/null; then
    if [[ $XDG_VTNR == 1 && -z ${WAYLAND_DISPLAY+.} ]]; then
        exec sway
    fi
fi

[[ -r ~/.bashrc ]] && source ~/.bashrc
