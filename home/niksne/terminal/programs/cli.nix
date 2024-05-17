{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    libnotify

    cmatrix
    pipes-rs

    du-dust
    busybox
    duf
    fd
    file
    jaq
    ripgrep
    nix-prefetch-github
  ];

  programs = {
    eza.enable = true;
    ssh.enable = true;
  };
}
