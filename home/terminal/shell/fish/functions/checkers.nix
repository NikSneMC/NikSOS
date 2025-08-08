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
    in
      # fish
      ''
        set backup_file ~/.cache/airplane_backup

        if test -e $backup_file
            echo ${tooltip.on}
        else
            echo ${tooltip.off}
        end
      '';
    check_night_mode.body = let
      tooltip = mkTooltips "󱩌" "󱩍" "night-mode";
    in
      # fish
      ''
        set backup_file ~/.cache/night_backup

        if test -e $backup_file
            echo ${tooltip.on}
        else
          echo ${tooltip.off}
        end
      '';
    check_recording.body =
      # fish
      ''
        set target_process "wf-recorder"

        if pgrep $target_process > /dev/null
            echo "{\"text\":\"\", \"tooltip\":\"Recording\", \"alt\":\"Recording\"}"
        end
      '';
  };
}
