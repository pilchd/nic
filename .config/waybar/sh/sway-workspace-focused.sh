#!/bin/sh
set -o errexit -o pipefail

echo 'welcome to Sway'
while true; do
    swaymsg -t subscribe '["workspace"]' | jq -r '.current.name | split(":")[-1]'
done
