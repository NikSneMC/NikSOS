{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.niksvim.modules.config];

  config.programs.nixvim.plugins.treesitter.package = lib.mkForce pkgs.master.vimPlugins.nvim-treesitter;
}
