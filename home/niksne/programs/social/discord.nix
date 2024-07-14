{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    vesktop
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

  xdg.configFile."vesktop/settings/quickCss.css".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css");

    body {
      font-family: JetBrainsMono Nerd Font;
    }
  '';
}