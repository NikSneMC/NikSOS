{pkgs, ...}: {
  imports = [
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    affine
    libreoffice
    simple-scan
  ];
}
