{
  ...
}: {
  programs.fish.functions = {
    toggle_airplane_mode.body = ''
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
    toggle_bluetooth.body = ''
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
    toggle_night_mode = ''
      set target_process "gammastep"
    
      if pgrep $target_process > /dev/null
        killall -s SIGINT .gammastep-wrap
      else
        gammastep
      end
    '';
    toggle_wifi.body = ''
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