{
  config,
  inputs,
  lib,
  lib',
  ...
}: let
  flavour = lib'.strings.mkUpper config.theme.flavor;
in {
  programs.vscode.profiles.default.userSettings =
    {
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
    }
    // (
      lib.pipe "${inputs.vscode-file-nesting-config-json}/settings.json" [
        builtins.readFile
        builtins.fromJSON
      ]
    );
}
