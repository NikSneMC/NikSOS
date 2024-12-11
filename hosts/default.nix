{
  homeImports,
  inputs,
  lib,
  self,
  ...
}: let
  inherit (import "${self}/system") minimal desktop laptop;

  hosts = {
    table-niksne = desktop;
    laptop-niksne = laptop;
    niksos-wsl = minimal;
  };
in {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;

    mkPkgsOverlays = lib.mapAttrsToList (name: input: _: _: {
      ${name} = import input {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    });
  in
    builtins.mapAttrs (host: type:
      nixosSystem rec {
        specialArgs = {
          inherit inputs self;
        };
        modules =
          type
          ++ [
            inputs.disko.nixosModules.disko
            inputs.agenix.nixosModules.age
            inputs.catppuccin.nixosModules.catppuccin
            ./${host}
            (
              if type != minimal
              then ./${host}/disks
              else {}
            )
            (
              if type != minimal
              then ./${host}/hardware-configuration.nix
              else {}
            )
            {
              networking.hostName = host;
              home-manager = {
                users = homeImports.raw.${host}
                  |> map (user: 
                    lib.nameValuePair user {imports = homeImports."${user}@${host}";}
                  )
                  |> builtins.listToAttrs;
                extraSpecialArgs = specialArgs;
              };
              nixpkgs.overlays = mkPkgsOverlays (with inputs; {
                inherit master unstable stable;
                custom = nikspkgs;
              });
            }
          ];
      })
    hosts;
}
