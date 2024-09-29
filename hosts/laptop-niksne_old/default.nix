{
  boot.loader.grub.device = "/dev/sda";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sky";
  };

  nix.settings = rec {
    cores = 2;
    max-jobs = cores * 4;
  };

  services = {
    fstrim.enable = true;
  };
}
