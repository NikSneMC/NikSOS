{pkgs, ...}: {
  imports = [
    # ./nixcord.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    tdesktop

    chatterino2
  ];
}
