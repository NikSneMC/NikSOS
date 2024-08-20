{
  inputs,
  pkgs,
  config,
  ...
}: {
  # themable spotify
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;

    theme = spicePkgs.themes.catppuccin;

    colorScheme = config.theme.flavor;

    # enabledExtensions = with spicePkgs.extensions; [
    # 
    # ];
    
  };
}
