{
  imports = [
    ./private
    # ../../system/hardware/nvidia.nix
    ../../system/hardware/amd.nix
    ../../system/hardware/razer.nix
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
    cores = 36;
    max-jobs = cores * 4;
  };

  services = {
    fstrim.enable = true;
  };

  hardware.openrazer.users = [ "niksne" ];
}
