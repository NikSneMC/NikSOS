{
  lib,
  pkgs,
  self,
  inputs,
  ...
}: let
  users = {
    table-niksne = ["niksne"];
    laptop-niksne = ["niksne"];
    niksos-wsl = ["niksne"];
  };

  rawMk = nameValueFunction: hosts:
    lib.pipe hosts [
      (lib.mapAttrsToList (
        host: builtins.map (user: nameValueFunction host user)
      ))
      builtins.concatLists
      builtins.listToAttrs
    ];

  homeImports =
    (
      rawMk (
        host: user: let
          modules = ../.;
        in
          lib.nameValuePair "${user}@${host}"
          [
            inputs.catppuccin.homeManagerModules.catppuccin
            self.homeManagerModules.homes
            self.homeManagerModules.theme
            (import ./${user} modules)
            (import ./${user}/hosts/${host} modules)
            {home = {inherit host user;};}
          ]
      )
      users
    )
    // {raw = users;};

  inherit (inputs.hm.lib) homeManagerConfiguration;
in {
  _module.args = {inherit homeImports;};

  flake.homeConfigurations = rawMk (host: user:
    lib.nameValuePair "${user}_${host}" (
      homeManagerConfiguration {
        modules = homeImports."${user}@${host}";
        extraSpecialArgs = {inherit inputs self;};
        inherit pkgs;
      }
    ))
  users;
}
