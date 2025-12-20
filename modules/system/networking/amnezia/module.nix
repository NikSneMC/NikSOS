{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.modules.networking.amnezia;
in {
  options.modules.networking.amnezia = {
    enable = mkEnableOption "amvezia module";
  };

  config = mkIf cfg.enable {
    boot.extraModulePackages = with config.boot.kernelPackages; [
      amneziawg
    ];

    environment.systemPackages = with pkgs; [
      amneziawg-tools
    ];

    programs.amnezia-vpn.enable = true;
  };
}
