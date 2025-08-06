{
  inputs,
  lib,
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm;
    wayland.enable = true;
  };

  catppuccin.sddm = {
    font = "Jetbrains Mono Nerd Font";
    fontSize = "10";
    background = "${inputs.assets}/wallpapers/night_forest.png";
    loginBackground = false;
  };
}
