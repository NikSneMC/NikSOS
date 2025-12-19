{
  config,
  flakeRoot,
  inputs,
  keys,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  inherit (import ./lib.nix {inherit flakeRoot keys lib;}) mkSecrets;

  cfg = config.modules.secrets.agenix;
in {
  options.modules.secrets.agenix = {
    enable = mkEnableOption "agenix";
  };

  imports = [inputs.agenix.nixosModules.default];

  config = mkIf cfg.enable {
    age.secrets = mkSecrets config;
  };
}
