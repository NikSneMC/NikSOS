#!/usr/bin/env bash

read -p "Enter device name: " HOST
mkdir ~/.config/nixos/hosts/$HOST
sudo nixos-generate-config
sudo cat /etc/nixos/hardware-configuration.nix >> ~/.config/nixos/hosts/$HOST/hardware-configuration.nix

read -p "Enter hostname: " HOSTNAME

echo "{
    imports = [
        ./hardware-configuration.nix
        ../../modules
    ];
    networking.hostName = \"$HOSTNAME\"; # Define your hostname.
}" >> ~/.config/nixos/hosts/$HOST/default.nix

rm -rf ~/.config/nixos/flake.nix
echo "{
  description = "NiKSne's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

      nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

      rust-overlay.url = "github:oxalica/rust-overlay";

      nnr.url = "github:niksnemc/nixpkgs";
  };

  outputs = { nixpkgs, nixpkgs-stable, rust-overlay, nnr, ... } @ inputs:
  {
    nixosConfigurations = {
      $HOSTNAME = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = { 
          inherit inputs; 
          pkgs-stable = import nixpkgs-stable {
            system = system;
            config.allowUnfree = true;
          };
          nnr = import nnr {
            system = system;
            config.allowUnfree = true;
            config.allowBroken = true;
          };
        };

        modules = [
          ./hosts/$HOST
        ];
      };
    };
  };
}" >> ~/.config/nixos/flake.nix

