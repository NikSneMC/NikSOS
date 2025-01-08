{
  lib,
  pkgs,
  ...
}: let
  disks = import ./disks.nix {inherit lib;};
  fish = import ./fish.nix;
  hyprland = import ./hyprland.nix {inherit lib;};
  nixcord = import ./nixcord.nix {inherit lib;};
  rofi = import ./rofi.nix {inherit lib;};
  strings = import ./strings.nix {inherit lib;};
  wlogout = import ./wlogout.nix {inherit lib pkgs;};
in {
  inherit disks fish hyprland nixcord rofi strings wlogout;
  inherit (rofi) toRasi;
}
