{
  config,
  lib,
  ...
}: let
  inherit (builtins) attrNames;
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.hardware.openrazer;
in {
  options.modules.hardware.openrazer = {
    enable = mkEnableOption "openrazar hardware support module";
  };

  config = mkIf cfg.enable {
    hardware.openrazer = {
      enable = true;
      users = config.users.users |> attrNames;
    };
  };
}
