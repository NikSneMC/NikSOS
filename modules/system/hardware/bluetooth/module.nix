{
  config,
  lib,
  lib',
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib'.options) overrideDefaultWith;
  inherit (lib'.tags.stateful config) hasTags;

  cfg = config.modules.hardware.bluetooth;
in {
  options.modules.hardware.bluetooth = {
    enable = mkEnableOption "bluetooth module" |> overrideDefaultWith (hasTags ["laptop"]);
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;
  };
}
