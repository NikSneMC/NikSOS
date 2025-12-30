{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = true;
    # I have 10xx series GPU so I have to use latest 580 driver
    package = let
      version = "580.119.02";
    in (config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
      src = pkgs.fetchurl {
        url = "https://download.nvidia.com/XFree86/Linux-x86_64/${version}/NVIDIA-Linux-x86_64-${version}.run";
        sha256 = "sha256-gCD139PuiK7no4mQ0MPSr+VHUemhcLqerdfqZwE47Nc=";
      };
    });
  };
}
