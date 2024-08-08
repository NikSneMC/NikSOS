{
  config, 
  pkgs,
  ... 
}: {
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = let
      version = "555.58";
    in (config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
      src = pkgs.fetchurl {
        url = "https://download.nvidia.com/XFree86/Linux-x86_64/${version}/NVIDIA-Linux-x86_64-${version}.run";
        sha256 = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
      };
    });
  };
}
