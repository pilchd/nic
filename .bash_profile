[[ -r ~/.bashrc ]] && source ~/.bashrc

if [[ $XDG_VTNR == 1 && -z ${WAYLAND_DISPLAY+1} ]] && command -v sway &> /dev/null; then
    exec sway
fi
