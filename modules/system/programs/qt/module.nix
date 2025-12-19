{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.programs.qt;
in {
  options.modules.programs.qt = {
    enable = options.qt.enable;
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "gtk2";
      style = "gtk2";
    };
  };
}
