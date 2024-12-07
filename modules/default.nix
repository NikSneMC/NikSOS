{
  flake = {
    homeManagerModules = {
      hosts = import ./hosts;
      theme = import ./theme;
    };
  };
}
