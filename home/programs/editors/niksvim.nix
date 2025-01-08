{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.niksvim.homeManagerModules.config];

  programs.niksvim = {
    # disableArrowKeys = true;

    nixvim.plugins.treesitter.package = lib.mkForce pkgs.master.vimPlugins.nvim-treesitter;
  };
}
