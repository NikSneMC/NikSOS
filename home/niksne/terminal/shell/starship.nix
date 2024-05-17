{
  config, 
  theme,
  ...
  }: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;

    catppuccin.enable = true;
    
    settings = {
      character = {
        success_symbol = "[❯](teal)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      directory = {
        truncation_length = 4;
        # Catppuccin 'lavender'
        style = "bold lavender";
      };
    };
  };
}
