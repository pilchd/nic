[[ -r ~/.bashrc ]] && source ~/.bashrc

if [[ -z ${WAYLAND_DISPLAY+1} ]] && [[ XDG_VTNR -eq 1 ]]; then
    exec sway
fi
