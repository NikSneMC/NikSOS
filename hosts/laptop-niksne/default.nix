mkNixosModules: {
  imports = mkNixosModules [
    # "hardware/intel.nix"
    "hardware/nvidia-prime.nix"
    "hardware/nvidia.nix"
    "programs/niri.nix"
    "programs/obs-studio.nix"
    "hardware/razer.nix"
    "services/thermald.nix"
    # "services/ollama.nix"
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
    displayManager.defaultSession = "niri";
    fstrim.enable = true;
  };

  hardware = {
    nvidia.prime = {
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };

    openrazer.users = ["niksne"];
  };
}
