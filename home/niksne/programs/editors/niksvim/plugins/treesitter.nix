{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        auto_install = false;
        highlight.enable = true;
      };
    };
    filetype.pattern = {
      ".*/hypr/hypr.*%.conf" = "hyprlang";
      ".*.http" = "http";
    };
  };
}
