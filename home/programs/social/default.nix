{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./discord.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    inputs.ayugram-desktop.packages.${system}.ayugram-desktop

    chatterino2
  ];
}
