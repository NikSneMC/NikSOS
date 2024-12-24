{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./binds.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      number = true;
      relativenumber = true;

      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      smartindent = true;
      cindent = true;
      smarttab = true;
    };

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = config.theme.flavor;
        transparent_background = true;
        integrations = {
          barbar = true;
          cmp = true;
          dashboard = true;
          gitsigns = true;
          indent_blankline = {
            enabled = true;
            colored_indent_levels = true;
          };
          native_lsp = true;
          neotree = true;
          rainbow_delimiters = true;
          telescope.enabled = true;
          treesitter = true;
          which_key = true;
        };
      };
    };
  };
}
