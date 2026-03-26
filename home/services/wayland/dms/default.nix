{inputs, ...}: {
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
    ./plugins.nix
  ];

  programs.dank-material-shell = {
    enable = true;

    niri.includes = {
      enable = true;
      override = false;

      filesToInclude = [
        "alttab"
        "binds"
        "colors"
        "cursor"
        "layout"
        "outputs"
        "windowrules"
        "wpblur"
      ];
    };

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableDynamicTheming = false;
  };
}
