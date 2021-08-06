#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT1/capacity)
case "$(cat /sys/class/power_supply/ACAD/online)" in
	0) [ "$capacity" -le 25 ] && warn="❗"; printf "%sBAT: %d%% ]" "$warn" "$capacity"; unset warn ;;
	1) printf 'REC:%s%% ' "$capacity" ;;
esac
