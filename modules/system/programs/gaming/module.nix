{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.programs.gaming;
in {
  options.modules.programs.gaming = {
    enable = mkEnableOption "gaming programs module";
  };

  config = mkIf cfg.enable {
    programs = {
      gamemode = {
        enable = true;
        settings = {
          general = {
            renice = 10;
          };
          gpu = {
            apply_gpu_optimisations = "accept-responsibility";
            gpu_device = 0;
            amd_performance_level = "high";
          };
          custom = {
            start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
            end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
          };
        };
      };
      gamescope = {
        enable = true;
        args = [
          "--rt"
          "--prefer-vk-device 8086:9bc4"
        ];
      };

      steam = {
        enable = true;
        package = pkgs.steam.override {
          extraPkgs = p:
            with p; [
              SDL2
              openal
              libglvnd
              gtk3
              mono
            ];
        };
        protontricks.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
    };

    environment.systemPackages = with pkgs; [
      libGL
      glfw3-minecraft
    ];
  };
}
