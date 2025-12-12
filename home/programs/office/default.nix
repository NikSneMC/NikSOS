{pkgs, ...}: {
  imports = [
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    affine
    openscad
    libreoffice
    simple-scan
  ];
}
