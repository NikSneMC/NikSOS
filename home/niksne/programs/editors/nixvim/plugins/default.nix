{
  pkgs,
  ...
}: {
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./neocord.nix
  ];

  programs.nixvim = {
    plugins = {
      wakatime.enable = true;
      nix.enable = true;
      nix-develop.enable = true;
      nvim-autopairs.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      neo-tree = {
        enable = true;
        filesystem.filteredItems.visible = true;
      };
      indent-blankline.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      friendly-snippets.enable = true;
      luasnip.enable = true;
      which-key.enable = true;      
      markdown-preview.enable = true;
      refactoring = {
        enable = true;
        enableTelescope = true;
      };
      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<C-t>]]";
          hide_numbers = true;
        };
      };
      project-nvim = {
        enable = true;
        enableTelescope = true;
      };
      rainbow-delimiters.enable = true;
      todo-comments.enable = true;
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
