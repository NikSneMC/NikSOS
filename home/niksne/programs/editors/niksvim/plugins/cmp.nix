{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        sources = [
          { name = "nvim_lsp_signature_help"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "codeium"; }
        ];
      };
    };
    codeium-nvim = {
      enable = true;
      extraOptions.enable_chat = true;
    };
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
  };
}
