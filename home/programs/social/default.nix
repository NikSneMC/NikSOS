{pkgs, ...}: {
  imports = [
    ./discord.nix
    ./matrix.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    ayugram-desktop

    chatterino2
  ];
}
