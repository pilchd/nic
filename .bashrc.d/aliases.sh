alias P='bat'

alias p='cat'

alias c='cp'
alias cr='cp -r'

alias bl='ddcutil setvcp 10'

alias df='df -h'
alias du='du -h'

alias e="$EDITOR"

alias dots="git --git-dir=\"$HOME/mnt/nic.git/\" --work-tree=\"$HOME/\""

alias k='ls -AFhNo --hide-control-chars --color=always | tail -n +2'
alias l='ls'
alias la='ls -a'
alias laf='ls -AF'
alias lal='ls -alh'
alias lalf='ls -AlhF'
alias lf='ls -F'
alias ll='ls -lh'
alias llf='ls -lhF'

alias d='lsblk'

alias m='mv'

alias md='mkdir'
mdg() { mkdir "$1" &> /dev/null || echo 'old friend' ; cd "$1" ; }
alias rd=rmdir

alias mo='mount'
alias mo.nic='mount -o dmask=0022,fmask=0133,uid=nic,gid=nic'
alias mo.nic-ro='mount -o dmask=0022,fmask=0133,uid=nic,gid=nic,ro'
alias om='umount'

alias yay='notify-send --app-name=bash Yay!'
alias boo='notify-send --app-name=bash Boo!'

alias ?='echo ${PIPESTATUS[*]}'

alias f='pushd'
F() { pushd "$1" && k ; }
alias j='popd'
alias J='cd ../'
alias JJ='cd ../../'
alias JJJ='cd ../../../'
alias JJJJ='cd ../../../../'
alias JJJJJ='cd ../../../../../'
alias JJJJJJ='cd ../../../../../../'
alias JJJJJJJ='cd ../../../../../../../'
alias JJJJJJJJ='cd ../../../../../../../../'
alias JJJJJJJJJ='cd ../../../../../../../../../'
alias g='dirs -p | nl -v 0 -w 1'
alias G='dirs -c'

alias smile='pw-play ~/.theme/smile'
alias frown='pw-play ~/.theme/frown'

alias insomnia='systemd-inhibit --what=handle-suspend-key:handle-hibernate-key:handle-lid-switch:sleep:shutdown --why="insomnia" '

alias o='xdg-open'

alias paintrain='sl'

alias r='rm -I'
alias rr='rm -rI'

alias ring='tput bel'

alias rsync='rsync -vh --info=progress2'

alias sl='sl -e'

alias s='sudo -v; sudo '
alias se='sudo -v; sudo -e'
alias sudo='sudo -v; sudo '
alias sk='sudo -K'

alias t='trash'

alias v='watch '

alias x='command -v'

alias copy='wl-copy'
alias past='wl-paste'

alias qr='zbarcam -Sdisable -Sqrcode.enable --nodisplay --raw'
alias rq='qrencode -m 2 -t UTF8'
