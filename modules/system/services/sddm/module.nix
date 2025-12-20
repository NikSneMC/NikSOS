{
  config,
  inputs,
  lib,
  options,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.services.sddm;
in {
  options.modules.services.sddm = {
    enable = options.services.displayManager.sddm.enable;
  };

  config = mkIf cfg.enable {
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
  };
}
