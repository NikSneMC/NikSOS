{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.fish.functions = {
    toggle_airplane_mode.body =
      # fish
      ''
        set backup_file ~/.cache/airplane_backup

        if test -e $backup_file
          set -l wifi_status (cat $backup_file | grep -o 'wifi:\(on\|off\)$' | cut -d':' -f2)
          set -l bluetooth_status (cat $backup_file | grep -o 'bluetooth:\(on\|off\)$' | cut -d':' -f2)

          if test "$wifi_status" = "on"
            nmcli radio wifi on
          end

          if test "$bluetooth_status" = "on"
            rfkill unblock bluetooth
          end

          rm $backup_file
        else
          echo "wifi:$(rfkill list wifi | grep -q "Soft blocked: no" && echo "on" || echo "off")" > $backup_file
          echo "bluetooth:$(rfkill list bluetooth | grep -qi "Soft blocked: no" && echo "on" || echo "off")" >> $backup_file

          nmcli radio wifi off
          rfkill block bluetooth
        end
      '';
    toggle_bluetooth.body =
      # fish
      ''
        set bluetooth_status (rfkill list bluetooth | grep -i -o "Soft blocked: yes")
        set backup_file ~/.cache/airplane_backup

        if [ -z "$bluetooth_status" ]
          rfkill block bluetooth
        else
          rfkill unblock bluetooth
          if test -e $backup_file
            rm $backup_file
          end
        end
      '';
    toggle_funky_stuff.body =
      # fish
      ''
        set FUNKY_STUFF_ENABLED (hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
        if [ "$FUNKY_STUFF_ENABLED" = 1 ]
            hyprctl --batch "\
                keyword animations:enabled 0;\
                keyword decoration:shadow:enabled 0;\
                keyword decoration:blur:enabled 0;\
                keyword decoration:active_opacity 1;\
                keyword decoration:inactive_opacity 1;\
                keyword general:border_size 1"
            exit
        end
        hyprctl reload
      '';
    toggle_night_mode =
      # fish
      ''
        set target_process "hyprsunset"

        if pgrep $target_process > /dev/null
          killall -s SIGINT hyprsunset
        else
          ${lib.getExe inputs.hyprsunset.packages.${pkgs.system}.hyprsunset} -t 5000
        end
      '';
    toggle_streamer_mode.body =
      # fish
      ''
        set backup_file ~/.cache/streamer_backup

        if test -e $backup_file
            rm $backup_file
        else
            touch $backup_file
        end
      '';
    toggle_wifi.body =
      # fish
      ''
        set wifi_status (nmcli radio wifi)
        set backup_file ~/.cache/airplane_backup

        if [ "$wifi_status" = enabled ]
          nmcli radio wifi off
        else
          nmcli radio wifi on
          if test -e $backup_file
            rm $backup_file
          end
        end
      '';
  };
}
