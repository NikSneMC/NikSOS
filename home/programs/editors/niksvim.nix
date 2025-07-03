{
  inputs,
  pkgs,
  ...
}: let
  niksvim = inputs.niksvim.packages.${pkgs.system}.default;
in {
  home.packages = [niksvim];
}
