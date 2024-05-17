{pkgs, ...}: {
  imports = [
    ./mpv.nix
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

    # videos
    celluloid
  ];
}
