{inputs, ...}: {
  imports = [
    "${inputs.private}/laptop-niksne/nixos"
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

  nix.settings = rec {
    cores = 8;
    max-jobs = cores * 4;
  };

  services = {
    fstrim.enable = true;
  };
}
