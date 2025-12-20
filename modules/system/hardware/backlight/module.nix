{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.hardware.backlight;
in {
  options.modules.hardware.backlight = {
    enable = mkEnableOption "backlight module";
  };

  config = mkIf cfg.enable {
    hardware.brillo.enable = true;
  };
}
