{
  pkgs, 
  ...
}: {
  programs.neovim = {
    enable = true;

    catppuccin.enable = true;

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
  };
}
