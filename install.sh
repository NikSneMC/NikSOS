#!/usr/bin/env bash

git clone https://github.com/NikSneMC/NikSOS.git ~/.config/

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
  description = \"NiKSne's NixOS Configuration\";

  inputs = {
      nixpkgs.url = \"github:NixOS/nixpkgs/nixos-unstable\";

      nixpkgs-stable.url = \"github:NixOS/nixpkgs/nixos-23.11\";

      rust-overlay.url = \"github:oxalica/rust-overlay\";

      nikspkgs.url = \"github:niksnemc/nikspkgs\";
  };

  outputs = { nixpkgs, nixpkgs-stable, rust-overlay, nikspkgs, ... } @ inputs:
  {
    nixosConfigurations = {
      $HOSTNAME = nixpkgs.lib.nixosSystem rec {
        system = \"x86_64-linux\";

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
          ./hosts/$HOST
        ];
      };
    };
  };
}" >> ~/.config/nixos/flake.nix

rm -rf ~/.config/nixos/modules/users.nix
read -p "Enter username: " USERNAME 
echo "{ pkgs, npkgs, ...}:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
        $USERNAME = {
            isNormalUser = true;
            description = \"$USERNAME\";
            extraGroups = [ \"networkmanager\" \"wheel\" \"audio\" \"video\" \"docker\"];
	        shell = pkgs.fish;
            packages = [
                pkgs.authy
                pkgs.vivaldi
                pkgs.vivaldi-ffmpeg-codecs
                pkgs.firefox
                
                pkgs.obs-studio
                pkgs.obs-studio-plugins.wlrobs
                pkgs.prismlauncher
                pkgs.spotify
                pkgs.spicetify-cli
                pkgs.blockbench-electron

                pkgs.vscodium
                pkgs.github-desktop
                pkgs.neovim
                pkgs.hoppscotch
                pkgs.rpi-imager

                nnr.jetbrains.idea-ultimate
                nnr.jetbrains.pycharm-professional
                nnr.jetbrains.webstorm
                nnr.jetbrains.datagrip
                pkgs.jetbrains.rust-rover
                nnr.jetbrains.clion
                nnr.jetbrains.goland
                nnr.jetbrains.gateway
                # nnr.jetbrains.writerside

                pkgs.vesktop
                pkgs.tdesktop
                pkgs.whatsapp-for-linux
            ];
        };
    };
}" >> ~/.config/nixos/modules/users.nix

git add *

sudo nixos-rebuild switch --flake ~/.config/nixos#$HOSTNAME && systemctl reboot
