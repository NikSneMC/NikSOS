{
  description = "NiKSne's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
      nikspkgs.url = "github:niksnemc/nikspkgs";

      rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { nixpkgs, nixpkgs-stable, rust-overlay, nikspkgs, ... } @ inputs:
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
          npkgs = import nikspkgs {
            system = system;
            config.allowUnfree = true;
            config.allowBroken = true;
          };
        };

        modules = [
          ./hosts/hp
        ];
      };
    };
  };
}
