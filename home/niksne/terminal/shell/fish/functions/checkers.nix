{
  theme,
  ...
}: {
  programs.fish.functions = {
    check_airplane_mode.body = ''
      set backup_file ~/.cache/airplane_backup

      if test -e $backup_file
          echo "{ \"text\":\"󰀝\", \"tooltip\": \"airplane-mode <span color='${theme.palette.green}'>on</span>\", \"class\": \"on\" }"
      else
          echo "{ \"text\":\"󰀞\", \"tooltip\": \"airplane-mode <span color='${theme.palette.maroon}'>off</span>\", \"class\": \"off\" }"
      end
    '';
    check_night_mode.body = ''
      set target_process "gammastep"
    
      if pgrep $target_process > /dev/null
          echo "{ \"text\":\"󱩌\", \"tooltip\": \"night-mode <span color='${theme.palette.green}'>on</span>\", \"class\": \"on\" }"
      else
          echo "{ \"text\":\"󱩍\", \"tooltip\": \"night-mode <span color='${theme.palette.maroon}'>off</span>\", \"class\": \"off\" }"
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