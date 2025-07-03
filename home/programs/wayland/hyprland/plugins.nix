{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = with inputs;
      (with hyprland-plugins.packages.${pkgs.system}; [
        # hyprexpo
        hyprtrails
      ])
      ++ [
        hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      ];

    settings.plugin = {
      hyprtrails.color = "$accent";
    };
  };
}
