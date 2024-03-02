{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ripgrep
        oath-toolkit
        imagemagick
        figlet
        rofimoji
        dos2unix
        speedtest-cli
        nix-prefetch-github
        playerctl
  ];
}
