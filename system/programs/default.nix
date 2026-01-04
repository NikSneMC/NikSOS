{pkgs, ...}: {
  imports = [
    ./development.nix
    ./dms.nix
    ./fonts.nix
    ./gaming.nix
    ./qt.nix
    ./xdg.nix
  ];

  programs = {
    dconf.enable = true;

    kdeconnect.enable = true;

    seahorse.enable = true;

    nix-ld.enable = true;

    gdk-pixbuf.modulePackages = [pkgs.librsvg];
  };

  environment.systemPackages = with pkgs; [
    ffmpeg-full
  ];
}
