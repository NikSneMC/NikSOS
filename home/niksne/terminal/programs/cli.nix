{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    libwebp

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

    packwiz
  ];

  programs = {
    eza.enable = true;
    ssh.enable = true;
  };
}
