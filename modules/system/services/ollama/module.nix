{
  config,
  lib,
  options,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.services.ollama;
in {
  options.modules.services.ollama = {
    enable = options.services.ollama.enable;
  };

  config = mkIf cfg.enable {
    services.ollama = {
      enable = true;
    };
  };
}
