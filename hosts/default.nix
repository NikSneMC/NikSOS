{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    inherit (import "${self}/system") desktop laptop;
    inherit (import "${self}/system/catppuccin.nix") theme;

    system = "x86_64-linux";

    specialArgs = {
      inherit inputs self theme; 
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