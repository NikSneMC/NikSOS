{
  pkgs,
  ...
}:{
  imports = [
    ./nixcord.nix
  ];

  home.packages = with pkgs; [
    tdesktop

    chatterino2
  ];
}
