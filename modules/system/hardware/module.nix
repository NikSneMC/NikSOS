{
  config,
  lib,
  lib',
  pkgs,
  ...
}: let
  inherit (lib) mkOption types mkIf fakeSha256 mkEnableOption;
  inherit (lib') overrideDefaultWith;
  inherit (lib'.tags.stateful config) hasTags;

  cfg = config.modules.hardware;
in {
  imports = [
    ./gpu
    ./cpu
  ];

  options.modules.hardware = {
    cpu = mkOption {
      type = types.either types.unspecified (types.enum ["intel" "amd"]);
      default = null;
    };
    gpu = mkOption {
      type = types.either types.unspecified (types.enum ["intel" "amd" "nvidia"]);
      default = null;
    };

    nvidiaPackage = mkIf (cfg.gpu == "nvidia") {
      type = mkOption {
        type = types.enum ["beta" "stable"];
        default = "beta";
      };
      version = mkOption {
        type = types.either types.unspecified types.nonEmptyStr;
        default = null;
      };
      sha256 = mkOption {
        type = types.str;
        default = fakeSha256;
      };
    };

    nvidiaPrime = {
      enable = mkEnableOption "nvidia prime with profiles" |> overrideDefaultWith (hasTags ["laptop"]);
    };
  };

  config = mkIf (cfg.gpu != null) {
    hardware.graphics = {
      extraPackages = with pkgs; [
        libva
        libva-vdpau-driver
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };
}
