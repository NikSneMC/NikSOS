{
  config,
  # pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    # package = let
    #   version = "560.35.03";
    # in (config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
    #   src = pkgs.fetchurl {
    #     url = "https://download.nvidia.com/XFree86/Linux-x86_64/${version}/NVIDIA-Linux-x86_64-${version}.run";
    #     sha256 = "${pkgs.lib.fakeSha256}";
    #   };
    # });
  };
}
