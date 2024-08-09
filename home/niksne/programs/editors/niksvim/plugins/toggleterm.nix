{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<C-t>]]";
      hide_numbers = true;
    };
  };
}
