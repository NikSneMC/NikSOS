{
  imports = [
    ./disks.nix
    ./hardware-configuration.nix
    ../../system/hardware/nvidia.nix
  ];

  boot.loader = {
    grub = {
      efiSupport = true;
      device = "nodev";
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "laptop-niksne";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sky";
  };

  nix.settings = {
    cores = 8;
    max-jobs = 32;
  };

  services = {
    fstrim.enable = true;
  };
}
