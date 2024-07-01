{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  imports = [
    ./specialisations.nix
    ./terminal
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nixvim.homeManagerModules.nixvim
    self.nixosModules.theme
  ];

  home = {
    username = "niksne";
    homeDirectory = "/home/niksne";
    stateVersion = "24.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;

  home.file.".face".source = let
    url = "https://raw.githubusercontent.com/NikSneMC/NikSOS/assets/icon.png";
    sha256 = "1p2sd07ch30hrnh85x2l2wchsazsmifrkcbrfxbbmvmidag07mdr";
    filename = lib.last (lib.splitString "/" url);
  in
    builtins.fetchurl {
      name = "${sha256}-user-${config.home.username}-${filename}";
      inherit url sha256;
    };
}
