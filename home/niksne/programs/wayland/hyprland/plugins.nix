{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = (with inputs.hyprland-plugins.packages.${pkgs.system}; [
      hyprexpo
      hyprtrails
    ]);

    settings.plugin = {
      hyprtrails.color = "$accent";
      hyprexpo = {
        columns = 3;
        gap_size = 7;
        bg_col = "$base";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = true; # laptop touchpad, 4 fingers
        gesture_distance = 300; # how far is the "max"
        gesture_positive = true; # positive = swipe down. Negative = swipe up.
      };
    };
  };
}