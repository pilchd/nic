#!/bin/sh

while true; do
    swaymsg -t subscribe '["workspace"]' | jq -r '.current.name' | cut -d ':' -f 2;
done
