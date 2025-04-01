{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./discord.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    inputs.ayugram-desktop.packages.${system}.ayugram-desktop

    chatterino2
  ];
}
