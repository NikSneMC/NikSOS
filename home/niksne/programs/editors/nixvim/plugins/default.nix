{
  pkgs,
  ...
}: {
  imports = [];

  programs.nixvim = {
    plugins = {
      codeium-nvim = {
        enable = true;
        extraOptions.enable_chat = true;
      };
      wakatime.enable = true;
      neocord = {
        enable = true;
        settings = {
          client_id = "1251330515147948083";
          logo = "https://cdn.discordapp.com/app-icons/1251330515147948083/d338503f6533c73291cc10719c80c623.png";
          logo_tooltip = "NixVim";
        };  
      };
      nix.enable = true;
      nix-develop.enable = true;
      transparent.enable = true;
      nvim-autopairs.enable = true;
      lualine.enable = true;
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
      gitsigns.enable = true;
      cmp = {
        enable = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      neo-tree.enable = true;
      indent-blankline.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      friendly-snippets.enable = true;
      luasnip.enable = true;
      which-key.enable = true;
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "neotree-file-nesting-config";
        src = pkgs.fetchFromGitHub {
          owner = "saifulapm";
          repo = "neotree-file-nesting-config";
          rev = "d9168eed2522397d271624e5f523d8384a552a64";
          hash = "sha256-qaB60iMLkuN5N9gnAJ2QHFmimlxTnBNlNqv6Zfb3aHg=";
        };
      })
    ];
  };
}
