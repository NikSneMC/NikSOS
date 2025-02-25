{
  homeImports,
  inputs,
  lib,
  lib',
  self,
  ...
}: let
  systemProfiles = import "${self}/system";

  mkPkgsOverlays = lib.mapAttrsToList (name: input: _: _: {
    ${name} = import input {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  });

  mkNixosModules = map (
    import:
      if (builtins.isString import)
      then "${self}/system/${import}"
      else import
  );

  mkHosts = builtins.mapAttrs (host: type:
    inputs.nixpkgs.lib.nixosSystem rec {
      specialArgs = {
        inherit inputs self lib';
      };
      modules =
        type
        ++ [
          inputs.disko.nixosModules.disko
          inputs.agenix.nixosModules.age
          inputs.catppuccin.nixosModules.catppuccin
          self.niksosModules.all
        #  (import "${inputs.private}" "nixos" host)
          (import "${self}/hosts/${host}" mkNixosModules)
          (
            if type != systemProfiles.minimal
            then "${self}/hosts/${host}/disks"
            else {}
          )
          (
            if type != systemProfiles.minimal
            then "${self}/hosts/${host}/hardware-configuration.nix"
            else {}
          )
          {
            networking.hostName = host;
            home-manager = {
              users = lib.pipe homeImports.raw.${host} [
                (map (
                  user: lib.nameValuePair user {imports = homeImports."${user}@${host}";}
                ))
                builtins.listToAttrs
              ];
              extraSpecialArgs = specialArgs;
            };
            nixpkgs.overlays = mkPkgsOverlays (with inputs; {
              inherit master unstable stable;
              custom = nikspkgs;
            });
          }
        ];
    });
in {
  inherit systemProfiles mkPkgsOverlays mkHosts;
}
