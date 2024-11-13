{config, ...}: {
  programs.fish.functions = {
    check_airplane_mode.body = ''
      set backup_file ~/.cache/airplane_backup

      if test -e $backup_file
          echo "{ \"text\":\"󰀝\", \"tooltip\": \"airplane-mode <span color='#${config.theme.colors.green}'>on</span>\", \"class\": \"on\" }"
      else
          echo "{ \"text\":\"󰀞\", \"tooltip\": \"airplane-mode <span color='#${config.theme.colors.maroon}'>off</span>\", \"class\": \"off\" }"
      end
    '';
    check_night_mode.body = ''
      set target_process "hyprsunset"

      if pgrep $target_process > /dev/null
          echo "{ \"text\":\"󱩌\", \"tooltip\": \"night-mode <span color='#${config.theme.colors.green}'>on</span>\", \"class\": \"on\" }"
      else
          echo "{ \"text\":\"󱩍\", \"tooltip\": \"night-mode <span color='#${config.theme.colors.maroon}'>off</span>\", \"class\": \"off\" }"
      end
    '';
    check_streamer_mode.body = ''
      set backup_file ~/.cache/streamer_backup

      if test -e $backup_file
          echo "{ \"text\":\"󰵝\", \"tooltip\": \"streamer-mode <span color='#${config.theme.colors.green}'>on</span>\", \"class\": \"on\" }"
          if test "$(count $argv)" -eq 0
              exit 1
          end
      else
          echo "{ \"text\":\"󱦿\", \"tooltip\": \"streamer-mode <span color='#${config.theme.colors.maroon}'>off</span>\", \"class\": \"off\" }"
      end
    '';
    check_recording.body = ''
      set target_process "wf-recorder"

      if pgrep $target_process > /dev/null
          echo "{\"text\":\"\", \"tooltip\":\"Recording\", \"alt\":\"Recording\"}"
      end
    '';
  };
}
