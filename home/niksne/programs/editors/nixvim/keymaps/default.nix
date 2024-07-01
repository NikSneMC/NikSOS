{
  ...
}: {
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<C-n>";
    }
    {
      action = "<cmd>Neotree focus<CR>";
      key = "<leader>e";
    }
  ];
}
