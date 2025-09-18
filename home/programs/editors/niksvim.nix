{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  niksvim = inputs.niksvim.lib.niksvimConfiguration pkgs {
    vim.theme.style = lib.mkForce config.theme.flavor;
  };
in {
  home.packages = [niksvim];
}
