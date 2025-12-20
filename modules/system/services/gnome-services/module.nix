{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.services.gnome-services;
in {
  options.modules.services.gnome-services = {
    enable = mkEnableOption "gnome services module";
  };

  config = mkIf cfg.enable {
    services = {
      dbus.packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];

      gnome.gnome-keyring.enable = true;

      gvfs.enable = true;
    };
  };
}
