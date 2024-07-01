{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    vesktop
    discord
  ];

  xdg.configFile."vesktop/settings/quickCss.css".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css");
  '';
}