{
  flake = {
    niksosModules = rec {
      all = caches;
      caches = import ./caches.nix;
    };
    homeManagerModules = rec {
      all = homes // theme;
      homes = import ./homes.nix;
      theme = import ./theme.nix;
    };
  };
}
