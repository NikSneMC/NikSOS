{
  inputs,
  lib,
  pkgs,
  ...
}: let
  niksos-logo = "${inputs.assets}/niksos/niksos100.png";
in {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["fat32" "ext4" "btrfs" "ntfs"];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 3;
    kernelParams = [
      # "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        extraFiles."theme/logo.png" = lib.mkForce niksos-logo;
        configurationLimit = 25;
      };
      timeout = 3;
    };

    plymouth = {
      enable = true;
      logo = niksos-logo;
    };
  };
}
