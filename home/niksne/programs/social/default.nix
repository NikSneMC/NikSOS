{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./nixcord.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop

    chatterino2
  ];
}
