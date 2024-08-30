{
  pkgs,
  ...
}:{
  imports = [
    ./nixcord.nix
  ];

  home.packages = with pkgs; [
    # element-desktop
    tdesktop

    chatterino2
  ];
}
