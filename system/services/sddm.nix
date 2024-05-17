{
  config,
  lib,
  pkgs,
  npkgs,
  ...
}: {
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = pkgs.libsForQt5.sddm;
      wayland.enable = true;
      autoNumlock = true;
      theme = "catppuccin-mocha";
      settings.Theme.ThemeDir = "/usr/share/sddm/themes/";
    };
  };
}
