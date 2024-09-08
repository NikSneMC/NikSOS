{
  imports = [
    ../../system/hardware/nvidia.nix
  ];

  boot.loader = {
    grub = {
      efiSupport = true;
      device = "nodev";
    };
    efi.canTouchEfiVariables = true;
  };

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
