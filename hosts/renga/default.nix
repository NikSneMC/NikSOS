mkNixosModules: {
  inputs,
  lib,
  ...
}: {
  imports = mkNixosModules [
    inputs.nixos-avf.nixosModules.avf
  ];

  avf = {
    defaultUser = "niksne";
  };

  nixpkgs.hostPlatform = "aarch64-linux";
  system.stateVersion = lib.mkDefault "26.05";
}
