{
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./extensions.nix
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  }; 
}
