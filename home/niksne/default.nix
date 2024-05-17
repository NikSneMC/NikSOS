{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    ./specialisations.nix
    ./terminal
    inputs.catppuccin.homeManagerModules.catppuccin
    self.nixosModules.theme
  ];

  home = {
    username = "niksne";
    homeDirectory = "/home/niksne";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
