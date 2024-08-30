{
  homeImports,
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;

    inherit (import "${self}/system") desktop laptop;

    system = "x86_64-linux";

    specialArgs = {
      inherit inputs self; 
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
      npkgs = import inputs.nikspkgs {
        inherit system;
        config.allowUnfree = true;
        config.allowBroken = true;
      };
    };
  in {
    table-niksne = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          inputs.catppuccin.nixosModules.catppuccin
          ./table-niksne
          {
            home-manager = {
              users.niksne.imports = homeImports."niksne@table-niksne";
              extraSpecialArgs = specialArgs;
            };
          }
        ];
    };
    laptop-niksne = nixosSystem {
      inherit specialArgs;
      modules =
        laptop
        ++ [
          inputs.catppuccin.nixosModules.catppuccin
          ./laptop-niksne
          {
            home-manager = {
              users = {
                niksne.imports = homeImports."niksne@laptop-niksne";
              };
              extraSpecialArgs = specialArgs;
            };
          }
        ];
    };
  };
}
