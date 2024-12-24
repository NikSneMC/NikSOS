{
  flake = {
    niksosModules = {
      all = import ./niksos;
      caches = import ./niksos/caches.nix;
    };
    homeManagerModules = {
      homes = import ./homes;
      theme = import ./theme;
    };
  };
}
