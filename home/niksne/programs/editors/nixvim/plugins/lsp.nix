{
  ...
}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        astro.enable = true;
        cssls.enable = true;
        golangci-lint-ls.enable = true;
        html.enable = true;
        java-language-server.enable = true;
        jsonls.enable = true;
        kotlin-language-server.enable = true;
        lua-ls.enable = true;
        marksman.enable = true;
        nil-ls.enable = true;
        pylsp.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        svelte.enable = true;
        tailwindcss.enable = true;
        tsserver.enable = true;
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
