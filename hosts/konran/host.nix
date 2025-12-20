{...}: {
  # imports = [
  #   # "hardware/nvidia.nix"
  #   "hardware/amd.nix"
  #   "hardware/razer.nix"
  #   "programs/niri.nix"
  #   "services/ollama.nix"
  # ];

  # boot.loader = {
  #   grub = {
  #     efiSupport = true;
  #     device = "nodev";
  #   };
  #   efi.canTouchEfiVariables = true;
  # };

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  #   accent = "sky";
  # };

  # services = {
  #   displayManager.defaultSession = "niri";
  #   fstrim.enable = true;
  # };

  # hardware.openrazer.users = ["niksne"];

  modules = {
    programs = {
      enable = true;
    };
    # services = {
    #   enable = true;
    # };

    secrets.agenix.enable = true;
    # nix.builders.enable = true;
  };

  # don't touch this
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.11";
}
