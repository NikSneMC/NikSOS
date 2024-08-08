{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "laptop-niksne";

  nix.settings = {
    cores = 2;
    max-jobs = 4;
  };

  services = {
    fstrim.enable = true;
  };
}
