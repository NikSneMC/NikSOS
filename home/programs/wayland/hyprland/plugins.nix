{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
      # hyprexpo
      hyprtrails
    ];

    settings.plugin = {
      hyprtrails.color = "$accent";
    };
  };
}
