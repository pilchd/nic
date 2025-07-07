#!/bin/sh
set -o errexit -o pipefail

while true; do
    swaymsg -t subscribe '["workspace"]' | jq -r '.current.name | split(":")[-1]'
done
