{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [inputs.niksvim.packages.${pkgs.system}.default];
}
