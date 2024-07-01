{
  programs.vscode.userSettings = {
    workbench.colorTheme = "Catppuccin Mocha";
    catppuccin.accentColor = "sky";
    vscord.app.name = "VSCodium";
    files.associations = {
      "*.lock" = "json";
    };
    editor.fontLigatures = true;
    codeium.enableConfig = {
      "*" = true;
      nix = true;
    };
    git.autofetch = true;
  };
}