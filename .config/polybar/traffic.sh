#!/bin/sh

logfile=/home/matt/.config/polybar/netlog
prevdata="$(cat "$logfile")"

rxcurrent="$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))"
txcurrent="$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))"

printf " %s  %s" "$(((rxcurrent - ${prevdata%% *}) / 1024))" "$(((txcurrent - ${prevdata##* }) / 1024))"

echo "$rxcurrent $txcurrent" > "$logfile"
