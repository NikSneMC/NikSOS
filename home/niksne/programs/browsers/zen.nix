{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.beta.specific
  ];
}
