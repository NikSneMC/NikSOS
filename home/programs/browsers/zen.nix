{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    (inputs.zen-browser.packages.${pkgs.system}.beta.override {
      iconsDir = "${inputs.assets}/icons/zen-browser";
    })
  ];
}
