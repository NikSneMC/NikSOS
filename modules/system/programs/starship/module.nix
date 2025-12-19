{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.programs.starship;
in {
  options.modules.programs.starship = {
    enable = mkEnableOption "starship";
  };

  config = mkIf cfg.enable {
    programs.starship.enable = true;
  };
}
