{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.services.kanata;
in {
  options.modules.services.kanata = {
    enable = options.services.kanata.enable;
  };

  config = mkIf cfg.enable {
    services.kanata = {
      enable = true;

      keyboards.default = {
        extraDefCfg = ''
          process-unmapped-keys yes
        '';
        config = builtins.readFile (./. + "/main.kbd");
      };
    };
  };
}
