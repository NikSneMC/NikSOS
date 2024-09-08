{
  boot.loader.grub.device = "/dev/sda";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sky";
  };

  nix.settings = {
    cores = 2;
    max-jobs = 4;
  };

  services = {
    fstrim.enable = true;
  };
}
