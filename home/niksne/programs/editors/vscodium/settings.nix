{
  config,
  lib,
  ...
}: let
  mkUpper =
    str:
    (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (builtins.stringLength str) str);
  flavour = mkUpper config.theme.flavor;
in {
  programs.vscode.userSettings = {
    window.autoDetectColorScheme = true;
    workbench = {
      colorTheme = "Catppuccin ${flavour}";
      preferredDarkColorTheme = "Catppuccin ${flavour}";
      preferredLightColorTheme = "Catppuccin ${flavour}";
    };
    catppuccin.accentColor = config.theme.accent;
    vscord.app.name = "VSCodium";
    files.associations = {
      "*.lock" = "json";
    };
    editor = {
      fontFamily = "'JetBrainsMono Nerd Font', 'monospace', monospace";
      fontLigatures = true;
    };
    codeium.enableConfig = {
      "*" = true;
      nix = true;
    };
    git.autofetch = true;
  };
}