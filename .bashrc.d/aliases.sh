#!/bin/bash

alias a='clear'

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'

alias acli='arduino-cli'

alias b='bat'

alias c='cp'
alias cr='cp -r'

alias cv='command -v'

alias copy='wl-copy'
alias paste='wl-paste'

alias d='lsblk'

alias bl='ddcutil setvcp 10'

alias df='df -h'
alias du='du -h'

alias e="$EDITOR"

alias ex='export'
alias de='unset'

alias f='fd'

alias ff='pushd'
alias jj='popd'

alias g='git'

alias insomnia='systemd-inhibit --what=handle-suspend-key:handle-hibernate-key:handle-lid-switch:sleep:shutdown --why="insomnia" '

alias json='jq .'

alias l='ls'
alias la='ls -a'
alias laf='ls -AF'
alias lal='ls -alh'
alias lalf='ls -AlhF'
alias lf='ls -F'
alias ll='ls -lh'
alias llf='ls -lhF'

alias m='mv'

alias md='mkdir'
mdg() {
    mkdir "$1"
    cd "$1"
}
alias rd=rmdir

alias mo='mount'
alias um='umount'
alias mount.nic='mount -o dmask=0022,fmask=0133,uid=nic,gid=nic'
alias mount.nic-ro='mount -o dmask=0022,fmask=0133,uid=nic,gid=nic,ro'

alias yay='notify-send --app-name=bash Yay!'
alias boo='notify-send --app-name=bash Boo!'

alias o='xdg-open'

alias p='cat'

alias paintrain='sl'

alias q='touch'

alias qr='zbarcam -Sdisable -Sqrcode.enable --nodisplay --raw'
alias qrc='qrencode -m 2 -t UTF8'

alias r='rm -I'
alias rr='rm -rI'

alias rsync='rsync -vh --info=progress2'

alias cooper='eval `ssh-agent`'
alias cherrypie='ssh-add ~/.ssh/id_ed25519'
alias earl='eval `ssh-agent -k`'

alias s='sudo -v; sudo '
alias se='sudo -v; sudo -e'
alias sudo='sudo -v; sudo '
alias sk='sudo -K'

alias bell='tput bel'

alias t='trash'

alias vv='watch '
