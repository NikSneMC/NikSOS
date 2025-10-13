{pkgs, ...}: {
  imports = [
    ./discord.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    ayugram-desktop

    chatterino2
  ];
}
