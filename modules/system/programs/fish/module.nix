{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.programs.fish;
in {
  options.modules.programs.fish = {
    enable = mkEnableOption "fish shell";
  };

  config = mkIf cfg.enable {
    programs.fish.enable = true;

    environment.pathsToLink = ["/share/fish"];
  };
}
