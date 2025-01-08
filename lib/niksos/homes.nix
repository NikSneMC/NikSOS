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
        host: map (user: nameValueFunction host user)
      ))
      builtins.concatLists
      builtins.listToAttrs
    ];

  mkHmModules = map (
    import:
      if (builtins.isString import)
      then "${self}/home/${import}"
      else import
  );

  mkHomeImports = users:
    (
      rawMk (
        host: user:
          lib.nameValuePair "${user}@${host}"
          [
            inputs.catppuccin.homeManagerModules.catppuccin
            self.homeManagerModules.homes
            self.homeManagerModules.theme
            (import "${inputs.private}" "hm" host)
            (import "${self}/home/profiles/${user}" mkHmModules)
            (import "${self}/home/profiles/${user}/hosts/${host}" mkHmModules)
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
