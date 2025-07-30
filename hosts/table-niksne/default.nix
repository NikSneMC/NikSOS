mkNixosModules: {
  imports = mkNixosModules [
    # "hardware/nvidia.nix"
    "hardware/amd.nix"
    "hardware/razer.nix"
    "programs/niri.nix"
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
    cores = 36;
    max-jobs = cores * 4;
  };

  services = {
    displayManager.defaultSession = "hyprland";
    fstrim.enable = true;
  };

  hardware.openrazer.users = ["niksne"];
}
