{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.services.kdeconnect;
in {
  options.modules.services.kdeconnect = {
    enable = options.services.kdeconnect.enable;
  };

  config = mkIf cfg.enable {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
