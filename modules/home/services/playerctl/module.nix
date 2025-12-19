{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.services.playerctl;
in {
  options.modules.services.playerctl = {
    enable = mkEnableOption "playerctl service module";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      playerctl
    ];

    services.playerctld.enable = true;
  };
}
