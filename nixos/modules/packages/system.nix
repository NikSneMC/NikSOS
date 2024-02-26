{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        neofetch
        cpufetch
        cmatrix
        rsclock
        libreoffice
        qbittorrent
        mc
        playerctl
    ];
}