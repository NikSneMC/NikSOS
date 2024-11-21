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

    pkgsArgs = {
      system = "x86_64-linux";
      config = {allowUnfree = true;};
    };
  in
    builtins.mapAttrs (host: type:
      nixosSystem rec {
        specialArgs = {
          inherit inputs self;
          spkgs = import inputs.nixpkgs-stable pkgsArgs;
          npkgs = import inputs.nikspkgs pkgsArgs;
          lpkgs = inputs.self.packages.${pkgsArgs.system};
        };
        modules =
          type
          ++ [
            inputs.disko.nixosModules.disko
            inputs.agenix.nixosModules.age
            inputs.catppuccin.nixosModules.catppuccin
            self.nixosModules.zapret
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
                users = lib.pipe homeImports.raw.${host} [
                  (builtins.map (
                    user: lib.nameValuePair user {imports = homeImports."${user}@${host}";}
                  ))
                  builtins.listToAttrs
                ];
                extraSpecialArgs = specialArgs;
              };
            }
          ];
      })
    hosts;
}
