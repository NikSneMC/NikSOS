{
  pkgs,
  self,
  lib,
  ...
}: {
  imports = [
    ./disks.nix
    ./hardware-configuration.nix
    ./servers
    ../../system/hardware/nvidia.nix
  ];

  boot.loader = {
    grub = {
      efiSupport = true;
      device = "nodev";
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "table-niksne";

  console.catppuccin.enable = true;

  nix.settings = {
    cores = 36;
    max-jobs = 144;
  };

  services = {
    fstrim.enable = true;
  };
}
