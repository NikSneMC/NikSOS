{
  lib,
  pkgs,
  ...
}: let
  disks = import ./disks.nix {inherit lib;};
  fish = import ./fish.nix;
  hyprland = import ./hyprland.nix {inherit lib;};
  discord = import ./discord.nix {inherit lib;};
  rofi = import ./rofi.nix {inherit lib;};
  strings = import ./strings.nix {inherit lib;};
  wlogout = import ./wlogout.nix {inherit lib pkgs;};
in {
  inherit disks fish hyprland discord rofi strings wlogout;
  inherit (rofi) toRasi;
}
