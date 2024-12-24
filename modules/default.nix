{
  flake = {
    homeManagerModules = {
      homes = import ./homes;
      theme = import ./theme;
    };
  };
}
