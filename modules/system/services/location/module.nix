{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.services.location;
in {
  options.modules.services.location = {
    enable = mkEnableOption "location services module";
  };

  config = mkIf cfg.enable {
    location.provider = "geoclue2";

    services.geoclue2.enable = true;
  };
}
