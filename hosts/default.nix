{
  homeImports,
  inputs,
  lib,
  self,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    inherit (import "${self}/system") desktop laptop;
    
    pkgsArgs = {
      system = "x86_64-linux";
      config = { allowUnfree = true; };
    };

    mkHosts = builtins.mapAttrs (host: type: nixosSystem rec {
      specialArgs = {
        inherit inputs self; 
        spkgs = import inputs.nixpkgs-stable pkgsArgs;
        npkgs = import inputs.nikspkgs pkgsArgs;
        lpkgs = inputs.self.packages.${pkgsArgs.system};
      };
      modules = type ++ [
        inputs.catppuccin.nixosModules.catppuccin
        ./${host}
        {
          home-manager = {
            users = builtins.listToAttrs (builtins.map (
              user: lib.nameValuePair user { imports = homeImports."${user}@${host}"; }
            ) homeImports.raw.${host});
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    });
  in mkHosts {
    table-niksne = desktop;
    laptop-niksne = laptop;
  };
}
