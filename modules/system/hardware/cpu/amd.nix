{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.hardware;
in {
  config = mkIf (cfg.cpu == "amd") {
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
