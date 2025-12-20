{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.services.udiskie;
in {
  options.modules.services.udiskie = {
    enable = options.services.udiskie.enable;
  };

  config = mkIf cfg.enable {
    services.udiskie.enable = true;
  };
}
