{
  config,
  lib',
  ...
}: {
  programs.fish.functions = {
    notifications.body = let
      tooltip = lib'.fish.mkTooltips config.theme.colors "󰂜" "󰪑" "notifications";
    in ''
      set COUNT (swaync-client -c)
      set ENABLED ${tooltip.on}
      set DISABLED ${tooltip.off}

      if [ $COUNT != 0 ]
          set ENABLED "{ \"text\": \"󰂚 $COUNT\", \"tooltip\": \"$COUNT notifications\", \"class\": \"on\" }"
          set DISABLED "{ \"text\": \"󰂛 $COUNT\", \"tooltip\": \"(silent) $COUNT notifications\", \"class\": \"off\" }"
      end

      if swaync-client -D | rg -q "false"
          echo $ENABLED
      else
          echo $DISABLED
      end
    '';
  };
}
