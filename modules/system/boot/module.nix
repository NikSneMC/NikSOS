{
  config,
  inputs,
  lib,
  lib',
  options,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkDefault mkForce;
  inherit (lib'.tags.stateful config) withoutTags;

  cfg = config.modules.boot;
  niksos-logo = "${inputs.assets}/niksos/niksos100.png";
in {
  options.modules.boot = let
    inherit (lib'.options) overrideDefault;
  in {
    loader = {
      efiSupport = overrideDefault options.boot.loader.grub.efiSupport true;
    };
    plymouth = {
      enable = overrideDefault options.boot.plymouth.enable true;
    };
  };

  config = mkIf (withoutTags ["wsl" "avf"]) {
    boot = {
      initrd = {
        systemd.enable = true;
        supportedFilesystems = ["fat32" "ext4" "btrfs" "ntfs"];
      };

      kernelPackages = mkDefault pkgs.linuxPackages_latest;
      consoleLogLevel = 3;
      kernelParams = [
        # "quiet"
        "systemd.show_status=auto"
        "rd.udev.log_level=3"
      ];

      loader =
        {
          grub = {
            inherit (cfg.loader) efiSupport;
            enable = true;
            useOSProber = true;
            extraFiles."theme/logo.png" = mkForce niksos-logo;
            configurationLimit = 25;
          };
          timeout = 3;
        }
        // (mkIf cfg.loader.efiSupport {
          efi.canTouchEfiVariables = true;
          grub.device = "nodev";
        });

      plymouth = {
        inherit (cfg.plymouth) enable;
        logo = niksos-logo;
      };
    };
  };
}
