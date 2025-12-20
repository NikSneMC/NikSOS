{...}: {
  # imports = [
  # ];

  modules = {
    programs = {
      enable = true;
    };

    secrets.agenix.enable = true;
    # nix.builders.enable = true;
  };

  # avf = {
  #   defaultUser = "niksne";
  # };

  # don't touch this
  nixpkgs.hostPlatform = "aarch64-linux";
  system.stateVersion = "26.05";
}
