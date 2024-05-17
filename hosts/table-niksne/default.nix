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
  ];

  boot.loader = {
    grub.efiSupport = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "table-niksne";

  nix.settings = {
    cores = 36;
    max-jobs = 144;
  };

  services = {
    fstrim.enable = true;
  };
}
