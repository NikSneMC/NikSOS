{pkgs, ...}: {
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      package = pkgs.master.vimPlugins.nvim-treesitter;
      settings = {
        auto_install = true;
        highlight.enable = true;
      };
    };
    filetype.pattern = {
      ".*/hypr/hypr.*%.conf" = "hyprlang";
      ".*.http" = "http";
    };
  };
}
