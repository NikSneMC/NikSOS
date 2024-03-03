#!/usr/bin/env bash

############ Variables ############
enable_battery=false
battery_charging=false

####### Check availability ########
for battery in /sys/class/power_supply/*BAT*; do
  if [[ -f "$battery/uevent" ]]; then
    enable_battery=true
    if [[ $(cat $battery/status) == "Charging" ]]; then
      battery_charging=true
    fi
    break
  fi
done

############# Output #############
if [[ $enable_battery == true ]]; then
  percentage=$(($(cat $battery/capacity)))
  if [[ $percentage -gt 100 ]]; then
    percentage=100
  fi
  if [[ $battery_charging == true ]]; then
    if [[ $percentage -eq 100 ]]; then
      echo -n "󰚥"
    else
      echo -n "󰂄"
    fi
  else
    case $percentage in
      100) echo -n "󰁹" ;;
      9[0-9]) echo -n "󰂂" ;;
      8[0-9]) echo -n "󰂁" ;;
      7[0-9]) echo -n "󰂀" ;;
      6[0-9]]) echo -n "󰁿" ;;
      5[0-9]) echo -n "󰁾" ;;
      4[0-9]) echo -n "󰁽" ;;
      3[0-9]) echo -n "󰁼" ;;
      2[0-9]) echo -n "󰁻" ;;
      1[0-9]) echo -n "󰁺" ;;
      [0-9]) echo -n "󰂃" ;;
    esac
  fi
  echo -n " $percentage%"
fi
echo ''