{
  config,
  theme,
  ...
}: let
  palette = theme."${config.theme.flavor}";
in {
  programs.fish.functions = {
    fetch_battery.body = ''
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
      echo ""
    '';
    fetch_music_player_data.body = ''
      set STATUS (playerctl status 2>&1)
      if [ $STATUS != "Paused" -a $STATUS != "Stopped" -a $STATUS != "No players found" ]
          playerctl -a metadata --format "Now playing: {{artist}} - {{markup_escape(title)}}"
      end
    '';
    fetch_music_player_data_colored.body = ''
      set STATUS (playerctl status 2>&1)
      if [ $STATUS != "Paused" -a $STATUS != "Stopped" -a $STATUS != "No players found" ]
        playerctl -a metadata --format "{\"text\": \"<span color='${palette.palette.peach}'>{{artist}}</span> - <span color='${palette.palette.mauve}'>{{markup_escape(title)}}</span>\", \"tooltip\": \"<i><span color='${palette.palette.green}'>{{playerName}}</span></i>\n<b><span color='${palette.palette.mauve}'>{{markup_escape(title)}}</span></b>\nby <span color='${palette.palette.peach}'>{{artist}}</span>\non <span color='${palette.palette.teal}'>{{album}}</span>\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}" -F
      end
    '';
  };
}