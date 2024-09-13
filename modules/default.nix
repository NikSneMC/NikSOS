{
  flake = {
    nixosModules = {
      theme = import ./theme;
    };
    homeManagerModules = {
      hosts = import ./hosts;
    };
  };
}
