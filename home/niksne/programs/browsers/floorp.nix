{
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.floorp;
    nativeMessagingHosts = with pkgs; [
      firefoxpwa
    ];
  };

  home.packages = with pkgs; [
    firefoxpwa
  ];
}