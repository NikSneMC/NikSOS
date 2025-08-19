mkNixosModules: {
  inputs,
  lib,
  ...
}: {
  imports = mkNixosModules [
    inputs.nixos-wsl.nixosModules.default
    "programs/development.nix"
  ];

  wsl = {
    enable = true;
    defaultUser = "niksne";
  };

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = lib.mkDefault "24.11";
}
