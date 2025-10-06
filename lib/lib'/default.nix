args: let
  discord = import ./discord.nix args;
  disks = import ./disks.nix args;
  fish = import ./fish.nix args;
  helix = import ./helix.nix args;
  jetbrains = import ./jetbrains.nix args;
  niri = import ./niri.nix (args // {inherit numbers;});
  numbers = import ./numbers.nix args;
  rofi = import ./rofi.nix args;
  strings = import ./strings.nix args;
  zellij = import ./zellij.nix args;
in {
  inherit discord disks fish helix jetbrains niri numbers rofi strings zellij;
  inherit (rofi) toRasi;
}
