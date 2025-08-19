{niksos, ...}: let
  inherit (niksos.homes) mkHomeImports mkHomes;

  users = {
    konran = ["niksne"];
    nakama = ["niksne"];
    tobichi = ["niksne"];
  };

  homeImports = mkHomeImports users;
in {
  _module.args = {inherit homeImports;};

  flake.homeConfigurations = mkHomes users;
}
