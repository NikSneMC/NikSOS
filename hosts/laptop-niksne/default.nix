{
  pkgs,
  self,
  lib,
  ...
}: {
  imports = [
    ./disks.nix
    ./hardware-configuration.nix
  ];

  boot.loader = {
    grub = {
      efiSupport = true;
      device = "nodev";
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "laptop-niksne";

  nix.settings = {
    cores = 8;
    max-jobs = 32;
  };

  services = {
    fstrim.enable = true;
  };
}
