{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./browsers
    ./editors
    ./media
    ./office
    ./social
    ./wayland
    ./dconf.nix
    ./gtk.nix
    ./qt.nix
    ./thunar.nix
  ];

  xdg.configFile."mimeapps.list".force = true;

  programs.java = {
    enable = true;
    package = pkgs.zulu21;
  };

  home.packages = with inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system};
    [
      whiskers
      catwalk
    ]
    ++ (with pkgs; [
      file-roller

      qbittorrent
      blockbench

      surrealist
      postman

      mission-center

      custom.catppuccin
    ]);
}
