{
  config,
  lib,
  options,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.virtualisation.podman;
in {
  options.modules.virtualisation.podman = {
    enable = options.virtualisation.podman.enable;
  };

  config = mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };

    environment.systemPackages = with pkgs; [
      podman-compose
      podman-desktop
    ];
  };
}
