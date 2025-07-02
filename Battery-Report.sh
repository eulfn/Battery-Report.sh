#!/bin/sh

clear

now() {
  date '+%Y-%m-%d %H:%M:%S'
}

# Grab battery info
b="$(dumpsys battery)"

# Parse fields
lvl=$(printf '%s\n' "$b" | grep -m1 'level:' | awk '{print $2}')
st=$(printf '%s\n' "$b" | grep -m1 'status:' | awk '{print $2}')
plug=$(printf '%s\n' "$b" | grep -m1 'plugged:' | awk '{print $2}')
tmp=$(printf '%s\n' "$b" | grep -m1 'temperature:' | awk '{print $2}')
volt=$(printf '%s\n' "$b" | grep -m1 'voltage:' | awk '{print $2}')
hlth=$(printf '%s\n' "$b" | grep -m1 'health:' | awk '{print $2}')
tec=$(printf '%s\n' "$b" | grep -m1 'technology:' | awk '{print $2}')

# Status string
case "$st" in
  1) s="Unknown" ;;
  2) s="Charging" ;;
  3) s="Discharging" ;;
  4) s="Not charging" ;;
  5) s="Full" ;;
  *) s="Unknown" ;;
esac

# Plugged string
case "$plug" in
  1) p="AC" ;;
  2) p="USB" ;;
  4) p="Wireless" ;;
  0) p="Unplugged" ;;
  *) p="Unknown" ;;
esac

# Health string
case "$hlth" in
  1) h="Unknown" ;;
  2) h="Good" ;;
  3) h="Overheat" ;;
  4) h="Dead" ;;
  5) h="Over voltage" ;;
  6) h="Unspecified failure" ;;
  7) h="Cold" ;;
  *) h="Unknown" ;;
esac

tc=$(awk 'BEGIN {printf "%.1f", ARGV[1]/10}' "$tmp")
vv=$(awk 'BEGIN {printf "%.3f", ARGV[1]/1000}' "$volt")

printf '\n🔋 Battery Health Report\n'
printf '-------------------------\n'
printf 'Time: %s\n' "$(now)"
printf '\n'
printf 'Level   : %s%%\n' "$lvl"
printf 'Status  : %s\n' "$s"
printf 'Source  : %s\n' "$p"
printf 'Temp    : %s °C\n' "$tc"
printf 'Volt    : %s V\n' "$vv"
printf 'Health  : %s\n' "$h"
printf 'Tech    : %s\n' "$tec"
printf '\n' 
