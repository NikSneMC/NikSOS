{
  config,
  inputs,
  lib,
  options,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.programs.niri;
in {
  imports = [inputs.niri-flake.nixosModules.niri];

  options.modules.programs.niri = {
    enable = options.programs.niri.enable;
  };

  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
    };

    xdg.portal.config.niri.default = ["gtk" "gnome"];
  };
}
