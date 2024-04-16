#!/bin/sh

# Make directories end in '/'!
TARGETS=(
    '.arduino15/arduino-cli.yaml'
    '.bash_profile'
    '.bashrc'
    '.bashrc.d/'
    '.config/bc/'
    '.config/exiftool/'
    '.config/feh/'
    '.config/fontconfig/fonts.conf'
    '.config/gtk-3.0/settings.ini'
    '.config/gtk-4.0/settings.ini'
    '.config/kitty/'
    '.config/mako/'
    '.config/nano/'
    '.config/nvim/'
    '.config/sway/'
    '.config/swaylock/'
    '.config/tio/'
    '.config/tofi/'
    '.config/user-dirs.dirs'
    '.config/waybar/'
    '.config/xdg-desktop-portal-termfilechooser/'
    '.gitconfig'
    '.gitignore'
    '.gtkrc-2.0'
    '.inputrc'
    '.local/share/appimagekit/no_desktopintegration'
    '.nvmrc'
    '.nvm/default-packages'
)

SRC="${PWD}/"
DST="${1}"

function confirm_dirs {
    echo "src: ${SRC}"
    echo "dst: ${DST}"
    read -r -p 'Continue? (y/[n]) '

    [[ $REPLY =~ ^y$ ]] && return 0 || return 1
}

confirm_dirs || exit 1

for path in "${TARGETS[@]}"; do
    mkdir -p "$(dirname "${DST}${path}")/"
    cp -rlf "${path}" "$(dirname "${DST}${path}")/"
done
