{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.programs.obs-studio;
in {
  options.modules.programs.obs-studio = {
    enable = options.programs.obs-studio.enable;
  };

  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
