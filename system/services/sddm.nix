{
  lib,
  pkgs,
  ...
}: {
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
      catppuccin = {
        enable = true;
        font = "Jetbrains Mono Nerd Font";
        fontSize = "10";
        background = let
          url = "https://raw.githubusercontent.com/NikSneMC/NikSOS/assets/wallpapers/wolfclan.png";
          sha256 = "1d64c1xky96dg4gzsg17xyrjgy6wv4x0babyyfsvin9zi53p2mlp";
          filename = lib.last (lib.splitString "/" url);
        in
          builtins.fetchurl {
            name = "${sha256}-wallpaper-${filename}";
            inherit url sha256;
          };
        loginBackground = false;
      };
    };
  };
}
