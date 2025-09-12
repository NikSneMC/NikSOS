{
  lib',
  pkgs,
  ...
}: let
  ides = [
    "idea-ultimate"
    # pycharm-professional
    # webstorm
    # "rust-rover"
    # goland
    # phpstorm
    # clion
    "datagrip"
  ];

  plugins = {
    common = [
      "catppuccin-theme"
      "catppuccin-icons"
      "ideavim"
      "nixidea"
      "rainbow-brackets"
      "-env-files"
      "gitlab"
    ];
    "idea-ultimate" = [
      "scala"
      "minecraft-development"
    ];
  };

  ides' = lib'.jetbrains.mkIdes pkgs ides plugins;
in {
  programs.jetbrains-remote = {
    enable = true;
    ides = ides';
  };
  home.packages = ides';
}
