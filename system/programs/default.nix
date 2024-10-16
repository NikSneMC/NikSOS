{pkgs, ...}: {
  imports = [
    ./development.nix
    ./fonts.nix
    ./gaming.nix
    ./hyprland.nix
    ./qt.nix
    ./xdg.nix
  ];

  programs = {
    dconf.enable = true;

    kdeconnect.enable = true;

    seahorse.enable = true;

    nix-ld.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];
}
