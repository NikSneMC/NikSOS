{lib, ...}: let
  discord = import ./discord.nix {};
  disks = import ./disks.nix {};
  fish = import ./fish.nix {};
  hyprland = import ./hyprland.nix {inherit lib numbers;};
  jetbrains = import ./jetbrains.nix {};
  niri = import ./niri.nix {inherit lib numbers;};
  numbers = import ./numbers.nix {};
  rofi = import ./rofi.nix {inherit lib;};
  strings = import ./strings.nix {inherit lib;};
in {
  inherit discord disks fish hyprland jetbrains niri numbers rofi strings;
  inherit (rofi) toRasi;
}
