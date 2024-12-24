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
    wf-recorder

    packwiz
  ];

  programs = {
    btop.enable = true;
    cava.enable = true;
    eza.enable = true;
    ssh.enable = true;
    yazi.enable = true;
  };
}
