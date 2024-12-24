{niksos, ...}: let
  inherit (niksos.homes) mkHomeImports mkHomes;

  users = {
    table-niksne = ["niksne"];
    laptop-niksne = ["niksne"];
    niksos-wsl = ["niksne"];
  };

  homeImports = mkHomeImports users;
in {
  _module.args = {inherit homeImports;};

  flake.homeConfigurations = mkHomes users;
}
