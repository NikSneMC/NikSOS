{lib, ...}: let
  mkServersList = servers:
    builtins.listToAttrs (
      builtins.map
      (server: lib.nameValuePair server {enable = true;})
      servers
    );
in {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers =
        (mkServersList [
          "astro"
          "clangd"
          "cmake"
          "cssls"
          "gopls"
          "html"
          "htmx"
          "jdtls"
          "jsonls"
          "kotlin_language_server"
          "lua_ls"
          "marksman"
          "nil_ls"
          "pyright"
          "svelte"
          "tailwindcss"
          "ts_ls"
        ])
        // {
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
    };
    lsp-format.enable = true;
    lsp-lines.enable = true;
    lspkind = {
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
      symbolMap = {
        Codeium = "";
      };
    };
  };
}
