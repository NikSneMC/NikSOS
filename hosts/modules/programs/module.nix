{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.programs;
in {
  options.modules.programs = {
    enable = mkEnableOption "default program configs";
  };

  config = mkIf cfg.enable {
    modules.programs = {
      fish.enable = true;
      starship.enable = true;
    };
  };
}
