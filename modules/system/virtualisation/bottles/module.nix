{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.virtualisation.bottles;
in {
  options.modules.virtualisation.bottles = {
    enable = mkEnableOption "bottles module";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [bottles];
  };
}
