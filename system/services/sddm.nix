{
  inputs,
  lib,
  pkgs,
  ...
}: {
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = lib.mkForce pkgs.kdePackages.sddm;
      wayland.enable = true;
    };
  };

  catppuccin.sddm = {
    font = "Jetbrains Mono Nerd Font";
    fontSize = "10";
    background = "${inputs.assets}/wallpapers/wolfclan.png";
    loginBackground = false;
  };
}
