{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.modules.hardware;
in {
  config = mkIf (cfg.gpu == "nvidia") ({
      services.xserver.videoDrivers = lib.mkDefault ["nvidia"];

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
          enable = false;
          finegrained = false;
        };
        open = false;
        nvidiaSettings = true;
        package = let
          inherit (cfg.nvidiaPackage) type version sha256;

          pkg = config.boot.kernelPackages.nvidiaPackages.${type};
        in
          if version == null
          then pkg
          else
            pkg.overrideAttrs {
              src = pkgs.fetchurl {
                url = "https://download.nvidia.com/XFree86/Linux-x86_64/${version}/NVIDIA-Linux-x86_64-${version}.run";
                inherit sha256;
              };
            };
      };
    }
    // (
      mkIf cfg.nvidiaPrime.enable {
        hardware.nvidia.prime = {
          offload = {
            enable = lib.mkOverride 990 true;
            enableOffloadCmd = lib.mkIf config.hardware.nvidia.prime.offload.enable true;
          };
        };

        specialisation = {
          battery-saver.configuration = {
            system.nixos.tags = ["battery-saver"];
            imports = [
              {
                boot.extraModprobeConfig = ''
                  blacklist nouveau
                  options nouveau modeset=0
                '';

                services.udev.extraRules = ''
                  # Remove NVIDIA USB xHCI Host Controller devices, if present
                  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"

                  # Remove NVIDIA USB Type-C UCSI devices, if present
                  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"

                  # Remove NVIDIA Audio devices, if present
                  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"

                  # Remove NVIDIA VGA/3D controller devices
                  ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
                '';
                boot.blacklistedKernelModules = [
                  "nouveau"
                  "nvidia"
                  "nvidia_drm"
                  "nvidia_modeset"
                ];
              }
            ];
            hardware.nvidia = {
              prime.offload.enable = lib.mkForce false;
              powerManagement = {
                enable = lib.mkForce false;
                finegrained = lib.mkForce false;
              };
            };
          };
        };
      }
    ));
}
