{
  pkgs,
  ...
}:{
  imports = [
    ./discord.nix
  ];

  home.packages = with pkgs; [
    # element-desktop
    tdesktop
    whatsapp-for-linux

    chatterino2
  ];
}
