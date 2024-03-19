function fetch_battery
  set enable_battery false
  set battery_charging false

  for battery in /sys/class/power_supply/*BAT*
    if test -f $battery/uevent
      set enable_battery true
      if test (cat $battery/status) = "Charging"
        set battery_charging true
      end
      break
    end
  end

  if test $enable_battery = true
    set percentage (math (cat $battery/capacity))
    if test $percentage -gt 100
      set percentage 100
    end
    if test $battery_charging = true
      if test $percentage -eq 100
        echo -n "󰚥"
      else
        echo -n "󰂄"
      end
    else
      switch $percentage
        case 100
          echo -n "󰁹"
        case (seq 90 99)
          echo -n "󰂂"
        case (seq 80 89)
          echo -n "󰂁"
        case (seq 70 79)
          echo -n "󰂀"
        case (seq 60 69)
          echo -n "󰁿"
        case (seq 50 59)
          echo -n "󰁾"
        case (seq 40 49)
          echo -n "󰁽"
        case (seq 30 39)
          echo -n "󰁼"
        case (seq 20 29)
          echo -n "󰁻"
        case (seq 10 19)
          echo -n "󰁺"
        case (seq 0 9)
          echo -n "󰂃"
      end
    end
    echo -n " $percentage%"
  end
  echo ''
end