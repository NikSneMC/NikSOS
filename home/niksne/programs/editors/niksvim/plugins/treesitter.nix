{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        highlight.enable = true;
      };
    };
    filetype.pattern = {
      ".*/hypr/hypr.*%.conf" = "hyprlang";
    };
  };
}
