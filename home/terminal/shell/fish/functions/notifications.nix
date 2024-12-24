{config, ...}: {
  programs.fish.functions = {
    notifications.body = with config.theme.colors; ''
      set COUNT (swaync-client -c)
      set ENABLED "{ \"text\": \"󰂜\", \"tooltip\": \"notifications <span color='#${green}'>on</span>\", \"class\": \"on\" }"
      set DISABLED "{ \"text\": \"󰪑\", \"tooltip\": \"notifications <span color='#${maroon}'>off</span>\", \"class\": \"off\" }"

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
