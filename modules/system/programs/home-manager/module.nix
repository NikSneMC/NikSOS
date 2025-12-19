{inputs, ...}: {
  imports = [inputs.hm.nixosModules.default];

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
