{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.hardware;
in {
  config = mkIf (cfg.cpu == "intel") {
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
