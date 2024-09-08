{
  homeImports,
  inputs,
  lib,
  self,
  ...
}: let
  inherit (import "${self}/system") desktop laptop;

  hosts = {
    table-niksne = desktop;
    laptop-niksne = laptop;
  };

in {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    
    pkgsArgs = {
      system = "x86_64-linux";
      config = { allowUnfree = true; };
    };
  in builtins.mapAttrs (host: type: nixosSystem rec {
      specialArgs = {
        inherit inputs self; 
        spkgs = import inputs.nixpkgs-stable pkgsArgs;
        npkgs = import inputs.nikspkgs pkgsArgs;
        lpkgs = inputs.self.packages.${pkgsArgs.system};
      };
      modules = type ++ [
        inputs.catppuccin.nixosModules.catppuccin
        ./${host}
        ./${host}/disks
        ./${host}/hardware-configuration.nix
        {
          networking.hostName = host;
          home-manager = {
            users = builtins.listToAttrs (builtins.map (
              user: lib.nameValuePair user { imports = homeImports."${user}@${host}"; }
            ) homeImports.raw.${host});
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    }) hosts;
}
