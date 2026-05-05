#!/bin/sh

n='
'

notify () {
    # device,class,current,percentage,max
    IFS=, read -a output -r

    notify-send \
        --app-name='brightness.sh' --urgency=low --expire-time=2000 \
        --hint=STRING:x-canonical-private-synchronous:brightness.sh \
        --hint=INT:value:${output[3]%\%} \
        'brightnessctl' "$(printf "<b>%s</b>\n%s/%s" ${output[3]} ${output[2]} ${output[4]})"
}

{
    case $1 in
        up)
            brightnessctl --machine-readable set ${2}%+
        ;;
        dn)
            brightnessctl --machine-readable set ${2}%-
        ;;
    esac
} | notify
