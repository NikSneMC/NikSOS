{
  description = "NiKSne's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { nixpkgs, nixpkgs-stable, ... } @ inputs:
  {
    nixosConfigurations = {
      laptop-niksne = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = { 
          inherit inputs; 
          pkgs-stable = import nixpkgs-stable {
            system = system;
            config.allowUnfree = true;
          };
        };

        modules = [
          ./hosts/dell
        ];
      };
    };
  };
}
