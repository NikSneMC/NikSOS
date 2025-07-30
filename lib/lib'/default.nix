{
  lib,
  pkgs,
  ...
}: let
  discord = import ./discord.nix {inherit lib;};
  disks = import ./disks.nix {inherit lib;};
  fish = import ./fish.nix;
  hyprland = import ./hyprland.nix {inherit lib numbers;};
  niri = import ./niri.nix {inherit lib numbers;};
  numbers = import ./numbers.nix {};
  rofi = import ./rofi.nix {inherit lib;};
  strings = import ./strings.nix {inherit lib;};
  wlogout = import ./wlogout.nix {inherit lib pkgs;};
in {
  inherit discord disks fish hyprland niri numbers rofi strings wlogout;
  inherit (rofi) toRasi;
}
