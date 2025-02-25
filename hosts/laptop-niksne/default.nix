mkNixosModules: {
  imports = mkNixosModules [
    "hardware/nvidia.nix"
    "programs/obs-studio.nix"
    "hardware/razer.nix"
    "services/ollama.nix"
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

  hardware.openrazer.users = ["niksne"];
}
