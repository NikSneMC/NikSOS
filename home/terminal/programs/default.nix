{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.default
    ./git
    ./zellij
    ./atuin.nix
    ./bat.nix
    ./cargo.nix
    ./eza.nix
    ./fetchers.nix
    ./lazydocker.nix
    ./skim.nix
    ./ssh.nix
    ./xdg.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    libwebp

    libnotify

    cmatrix
    pipes-rs

    dust
    uutils-coreutils-noprefix
    duf
    fd
    file
    jaq
    ripgrep
    nix-prefetch-github
    nix-output-monitor
    wf-recorder
    tree
    wget

    packwiz
    inputs.git-helper.packages.${stdenv.hostPlatform.system}.git-helper
  ];

  programs = {
    btop.enable = true;
    cava.enable = true;
  };
}
