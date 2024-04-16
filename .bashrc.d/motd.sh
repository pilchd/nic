#!/bin/bash

PASTIME_FILE=~/.pastime.txt


if [[ -r "$PASTIME_FILE" ]]; then
    DATE_PASTIME=($(grep -v '^#' "$PASTIME_FILE"))
    DATE=${DATE_PASTIME[0]}
    PASTIME=${DATE_PASTIME[1]}
    # Calculate days to the pastime
    # https://stackoverflow.com/a/29019048
    DAYS=$(( ($(date -d "$DATE UTC" +%s) - $(date -d "$(date -I) UTC" +%s)) / (60 * 60 * 24) ))
    [[ $DAYS -le 0 ]] && DAYS='zero! :)'
    # Space-pad the time display to match the pastime display's final column
    TAB_TIME=' '
    for ((char=0; char < ${#PASTIME}; char++)); do
        TAB_TIME+=' '
    done
fi

# For the fans
command -v fortune &> /dev/null && command -v cowsay &> /dev/null && fortune | cowsay
# Time display
echo "[90mSystem time is $TAB_TIME[32m$(date "+%m-%d %a %H:%M")[0m"
# Pastime display
[[ -n "$PASTIME" ]] && echo "[90mDays until $PASTIME are [31m$DAYS[0m"

# Finish with a newline
echo
