{
  inputs,
  lib,
  pkgs,
  ...
}: let
  mkServersList = servers:
    servers
    |> map (server: lib.nameValuePair server {enable = true;})
    |> builtins.listToAttrs;
in {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers =
        (mkServersList [
          "arduino_language_server"
          "astro"
          "basedpyright"
          "clangd"
          "cmake"
          "cssls"
          "docker_compose_language_service"
          "dockerls"
          "elixirls"
          "eslint"
          "gopls"
          "graphql"
          "html"
          "htmx"
          "jdtls"
          "jsonls"
          "kotlin_language_server"
          "lua_ls"
          "marksman"
          "nginx_language_server"
          "nim_langserver"
          "postgres_lsp"
          "sqls"
          "svelte"
          "tailwindcss"
          "volar"
          "yamlls"
          "zls"
        ])
        // {
          nil_ls = {
            enable = true;
            package = inputs.nil.packages.${pkgs.system}.nil;
            # settings.formatting.command = ["alejandra"];
          };
        };
    };
    clangd-extensions.enable = true;
    rustaceanvim = {
      enable = true;
      settings.server = {
        load_vscode_settings = true;
      };
    };
    typescript-tools.enable = true;
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
