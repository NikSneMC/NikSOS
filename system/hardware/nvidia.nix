{config, ...}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = true;

    # I have 10xx series GPU so I have to use latest 580 drivers
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
}
