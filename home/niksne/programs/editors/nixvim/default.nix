{
  ...
}: {
  imports = [
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    opts = {
      number = true;
      shiftwidth = 2;
    };

    globals.mapleader = " ";

    colorschemes.catppuccin.enable = true;
  };
}
