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

  system.stateVersion = lib.mkDefault "26.05";
}
