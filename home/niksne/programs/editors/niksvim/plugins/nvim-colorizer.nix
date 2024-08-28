{
  programs.nixvim.plugins.nvim-colorizer = {
    enable = true;
    fileTypes = [
      {
        language = "nix";
        names = false;
      }
    ];
  };
}
