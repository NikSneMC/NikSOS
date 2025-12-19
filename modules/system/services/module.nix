{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.services;
in {
  options.modules.services = {
    enable = mkEnableOption "services module";
  };

  config = mkIf cfg.enable {
    services = {
      dbus.implementation = "broker";

      psd = {
        enable = true;
        resyncTimer = "10m";
      };
    };
  };
}
