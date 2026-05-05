#!/bin/sh

notify-send -t 2000 -a systemctl \
    hibernate \
    'The system will hibernate in 12 seconds.\nThe lid switch has been disabled.'
sleep 12 ; systemctl hibernate
