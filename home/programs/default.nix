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
    ./gtk.nix
    ./qt.nix
  ];

  programs.java = {
    enable = true;
    package = pkgs.zulu21;
  };

  home.packages = with inputs.catppuccin.packages.${pkgs.system};
    [
      whiskers
      catwalk
    ]
    ++ (with pkgs; [
      file-roller

      qbittorrent
      tmux
      blockbench

      surrealist
      postman

      mission-center

      custom.catppuccin
    ]);
}
