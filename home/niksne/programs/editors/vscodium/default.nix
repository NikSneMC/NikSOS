{
  pkgs,
  ...
}: {
  imports = [
    ./extensions.nix
    ./settings.nix
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  }; 

  # xdg.configFile."VSCodium/product.json".text = builtins.toJSON {
  #   extensionsGallery = {
  #     serviceUrl = "https =//marketplace.visualstudio.com/_apis/public/gallery";
  #     cacheUrl = "https =//vscode.blob.core.windows.net/gallery/index";
  #     itemUrl = "https =//marketplace.visualstudio.com/items";
  #     controlUrl = "";
  #     recommendationsUrl = "";
  #  };
  # };
}
