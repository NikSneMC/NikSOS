{pkgs, ...}: {
  imports = [
    ./mpv.nix
    ./obs-studio.nix
    ./rnnoise.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    pamixer
    pulsemixer

    # audio
    amberol

    # images
    loupe
    imagemagick
    gimp-with-plugins

    # videos
    celluloid
  ];
}
