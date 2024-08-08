{
  inputs,
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.hyprpaper;

    settings = {
      ipc = false;
      preload = [
        config.theme.wallpaper
      ];
      wallpaper = [
        ", ${config.theme.wallpaper}"
      ];
    };
  };
}
