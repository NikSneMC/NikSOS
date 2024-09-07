{
  homeImports,
  inputs,
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

    mkHosts = hosts: builtins.mapAttrs (name: type: nixosSystem rec {
      specialArgs = {
        inherit inputs self; 
        spkgs = import inputs.nixpkgs-stable pkgsArgs;
        npkgs = import inputs.nikspkgs pkgsArgs;
        lpkgs = inputs.self.packages.${pkgsArgs.system};
      };
      modules = type ++ [
        inputs.catppuccin.nixosModules.catppuccin
        "./table-niksne"
        {
          home-manager = {
            users.niksne.imports = homeImports."niksne@${name}";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    }) hosts;
  in mkHosts {
    table-niksne = desktop;
    laptop-niksne = laptop;
  };
}
