{
  ...
}: {
  programs.fish.functions = {
    reload_bar.body = ''
      pkill -USR2 waybar
      notify-send waybar "Configuration reloaded!"
    '';
    reload_notifications.body = ''
      swaync -R
      swaync -rs
      notify-send swaync "Configuration reloaded!"
    '';
    reload_pyprland.body = ''
      pypr reload
      notify-send pyprland "Configuration reloaded!"
    '';
  };
}