{
  programs.fish.functions = {
    reload_bar.body =
      # fish
      ''
        pkill -12 waybar
        notify-send waybar "Configuration reloaded!"
      '';
    reload_notifications.body =
      # fish
      ''
        swaync -R
        swaync -rs
        notify-send swaync "Configuration reloaded!"
      '';
    reload_pyprland.body =
      # fish
      ''
        pkill -9 pypr
        rm /run/user/1000/hypr/*/.pyprland.sock
        hyprctl dispatch exec "pypr"
        notify-send pyprland "Configuration reloaded!"
      '';
  };
}
