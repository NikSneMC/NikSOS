{
  flake = {
    nixosModules = {
      zapret = import ./zapret;
    };
    homeManagerModules = {
      hosts = import ./hosts;
      theme = import ./theme;
    };
  };
}
