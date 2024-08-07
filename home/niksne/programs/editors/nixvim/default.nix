{
  config,
  ...
}: {
  imports = [
    # ./keymaps
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

      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      smartindent = true;
      cindent = true;
      smarttab = true;
    };

    globals.mapleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = config.theme.flavor;
        integrations = {
          barbar = true;
          neotree = true;
          cmp = true;
          treesitter = true;
          rainbow_delimiters = true;
          telescope.enabled = true;
          which_key = true;
        };
      };
    };
  };
}
