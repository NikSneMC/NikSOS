{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<leader>t]]";
      hide_numbers = true;
      insert_mappings = false;
    };
  };
}
