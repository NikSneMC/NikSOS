{
  inputs,
  pkgs,
  config,
  ...
}: {
  # themable spotify
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  in {
    enable = true;

    theme = spicePkgs.themes.catppuccin;

    colorScheme = config.theme.flavor;

    enabledExtensions = with spicePkgs.extensions; [

    ];
  };
}
