{...}: {
  imports = [
    # "programs/development.nix"
    # "virtualisation/podman.nix"
  ];

  # wsl.defaultUser = "niksne";

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
