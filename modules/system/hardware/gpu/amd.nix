{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.hardware;
in {
  config = mkIf (cfg.gpu == "amd") {
    services.xserver.videoDrivers = lib.mkDefault ["modesetting"];

    hardware.graphics = {
      enable = lib.mkDefault true;
      enable32Bit = lib.mkDefault true;
    };

    hardware.amdgpu.initrd.enable = lib.mkDefault true;
  };
}
