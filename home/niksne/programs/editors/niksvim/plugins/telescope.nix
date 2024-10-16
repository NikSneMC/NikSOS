{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";

      "<leader>gc" = "git_commits";
      "<leader>gb" = "git_branches";
      "<leader>gs" = "git_status";
    };
  };
}
