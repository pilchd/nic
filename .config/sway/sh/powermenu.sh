message='See you soon.
Good bye!'
message_hibernate='The system will hibernate in 60 seconds.
The lid switch is disabled; you may lock or close the machine.
Sleep tight!'

case $(
    echo 'suspend hibernate reboot poweroff' | tr ' ' '\n' |
    fuzzel --dmenu --mesg="$message" --select='poweroff' --auto-select --minimal-lines
) in
    suspend)
        systemctl suspend
    ;;
    hibernate)
        notify-send --app-name=powermenu --urgency=low --expire-time 10000 'hibernate' "$message_hibernate"

        systemd-inhibit --what=handle-lid-switch --who='powermenu' --why='hibernate' \
            sh -c 'sleep 60 ; systemctl hibernate'
    ;;
    reboot)
        systemctl reboot
    ;;
    poweroff)
        systemctl poweroff
    ;;
esac
