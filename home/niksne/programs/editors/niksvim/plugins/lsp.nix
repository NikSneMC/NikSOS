{
  lib,
  ...
}: let
  mkServersList = servers: builtins.listToAttrs (builtins.map 
    (server: lib.nameValuePair server { enable = true; })
    servers
    );
in {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = (mkServersList [
        "astro"
        "clangd"
        "cmake"
        "cssls"
        "gopls"
        "html"
        "htmx"
        "jdt-language-server"
        "jsonls"
        "kotlin-language-server"
        "lua-ls"
        "marksman"
        "nil-ls"
        "pylsp"
        "svelte"
        "tailwindcss"
        "tsserver"
      ]) // {
        rust-analyzer = {
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
