{
  pkgs, 
  npkgs,
  inputs,
  ...
}: {
  imports = [
    ./anyrun
    ./browsers
    ./editors
    ./media
    ./gtk.nix
    ./office
    ./wayland
  ];

  programs.java = {
    enable = true;
    package = pkgs.zulu17;
  };

  home.packages = with inputs; [
    catppuccin-toolbox.packages.${pkgs.system}.whiskers
    catppuccin-toolbox.packages.${pkgs.system}.catwalk
  ] ++ (with pkgs; [
    rofi
    rofimoji
    oath-toolkit
    gnome.file-roller
    swww

    qbittorrent
    element-desktop
    tmux
    gparted

    tdesktop
    vesktop
    discord
    whatsapp-for-linux

    mission-center
    wineWowPackages.wayland
  ]) ++ (with npkgs; [
    catppuccin
  ]);
}
