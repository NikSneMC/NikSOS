{
  config,
  lib',
  ...
}: {
  programs.fish.functions = let
    mkTooltips = lib'.fish.mkTooltips config.theme.colors;
  in {
    check_airplane_mode.body = let
      tooltip = mkTooltips "󰀝" "󰀞" "airplane-mode";
    in ''
      set backup_file ~/.cache/airplane_backup

      if test -e $backup_file
          echo ${tooltip.on}
      else
          echo ${tooltip.off}
      end
    '';
    check_night_mode.body = let
      tooltip = mkTooltips "󱩌" "󱩍" "night-mode";
    in ''
      set target_process "hyprsunset"

      if pgrep $target_process > /dev/null
          echo ${tooltip.on}
      else
        echo ${tooltip.off}
      end
    '';
    check_streamer_mode.body = let
      tooltip = mkTooltips "󰵝" "󱦿" "streamer-mode";
    in ''
      set backup_file ~/.cache/streamer_backup

      if test -e $backup_file
          echo ${tooltip.on}
          if test "$(count $argv)" -eq 0
              exit 1
          end
      else
        echo ${tooltip.off}
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
