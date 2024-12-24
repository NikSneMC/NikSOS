{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  rawMk = nameValueFunction: hosts:
    lib.pipe hosts [
      (lib.mapAttrsToList (
        host: builtins.map (user: nameValueFunction host user)
      ))
      builtins.concatLists
      builtins.listToAttrs
    ];

  mkHomeImports = users:
    (
      rawMk (
        host: user: let
          modules = "${self}/home";
        in
          lib.nameValuePair "${user}@${host}"
          [
            inputs.catppuccin.homeManagerModules.catppuccin
            self.homeManagerModules.homes
            self.homeManagerModules.theme
            (import "${self}/home/profiles/${user}" modules)
            (import "${self}/home/profiles/${user}/hosts/${host}" modules)
            {home = {inherit host user;};}
          ]
      )
      users
    )
    // {raw = users;};

  mkHomes = homeImports:
    rawMk (host: user:
      lib.nameValuePair "${user}_${host}" (
        inputs.hm.lib.homeManagerConfiguration {
          modules = homeImports."${user}@${host}";
          extraSpecialArgs = {
            inherit inputs self;
          };
          inherit pkgs;
        }
      ));
in {
  inherit rawMk mkHomeImports mkHomes;
}
