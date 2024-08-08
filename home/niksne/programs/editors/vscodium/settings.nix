{
  config,
  lib,
  ...
}: let
  mkUpper =
    str:
    (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (builtins.stringLength str) str);
in {
  programs.vscode.userSettings = {
    window.autoDetectColorScheme = true;
    workbench.colorTheme = "Catppuccin ${mkUpper config.theme.flavor}";
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