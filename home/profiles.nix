{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = { inherit inputs self; };

  homeImports = {
    "niksne@table-niksne" = [
      ./niksne
      ./niksne/profiles/table-niksne
    ];
    "niksne@laptop-niksne" = [
      ./niksne
      ./niksne/profiles/laptop-niksne
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = { inherit homeImports; };

  flake = {
    homeConfigurations = {
      "niksne_table-niksne" = homeManagerConfiguration {
        modules = homeImports."niksne@table-niksne";
        inherit pkgs extraSpecialArgs;
      };
      "niksne_laptop-niksne" = homeManagerConfiguration {
        modules = homeImports."niksne@laptop-niksne";
        inherit pkgs extraSpecialArgs;
      }; 
    };
  };
}
