mkNixosModules: {
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = mkNixosModules [
    inputs.nixos-avf.nixosModules.avf
  ];

  avf = {
    defaultUser = "niksne";
  };

  boot.kernelPackages = lib.mkForce pkgs.linuxKernel.kernels.linux_6_1;

  nixpkgs.hostPlatform = "aarch64-linux";
  system.stateVersion = lib.mkDefault "26.05";
}
