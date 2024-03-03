#!/usr/bin/env bash

############ Variables ############
enable_battery=false
battery_charging=false

####### Check availability ########
for battery in /sys/class/power_supply/*BAT*; do
  if [[ -f "$battery/uevent" ]]; then
    enable_battery=true
    if [[ $(cat /sys/class/power_supply/*/status | head -1) == "Charging" ]]; then
      battery_charging=true
    fi
    break
  fi
done

############# Output #############
percentage="$(cat /sys/class/power_supply/*/capacity | head -1)"
if [[ $enable_battery ]]; then
  if [[ $battery_charging && $percentage == 100 ]]; then
    echo -n "󰚥"
  fi
  if [[ $battery_charging && $percentage != 100 ]]; then
    echo -n "󰂄"
  fi
  if [[ ! $battery_charging && 100 > $percentage && $percentage > 89 ]]; then
    echo -n "󰂂"
  fi
  if [[ ! $battery_charging && 90 > $percentage && $percentage > 79 ]]; then
    echo -n "󰂁"
  fi
  if [[ ! $battery_charging && 80 > $percentage && $percentage > 69 ]]; then
    echo -n "󰂀"
  fi
  if [[ ! $battery_charging && 70 > $percentage && $percentage > 59 ]]; then
    echo -n "󰁿"
  fi
  if [[ ! $battery_charging && 60 > $percentage && $percentage > 49 ]]; then
    echo -n "󰁾"
  fi
  if [[ ! $battery_charging && 50 > $percentage && $percentage > 39 ]]; then
    echo -n "󰁽"
  fi
  if [[ ! $battery_charging && 40 > $percentage && $percentage > 29 ]]; then
    echo -n "󰁼"
  fi
  if [[ ! $battery_charging && 30 > $percentage && $percentage > 19 ]]; then
    echo -n "󰁻"
  fi
  if [[ ! $battery_charging && 20 > $percentage && $percentage > 9 ]]; then
    echo -n "󰁺"
  fi
  if [[ ! $battery_charging && 10 > $percentage && $percentage > 5 ]]; then
    echo -n "󰂃"
  fi
  echo -n " $percentage%"
fi

echo ''