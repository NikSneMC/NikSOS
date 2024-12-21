{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    settings.fileTypes = [
      {
        language = "nix";
        names = false;
      }
    ];
  };
}
