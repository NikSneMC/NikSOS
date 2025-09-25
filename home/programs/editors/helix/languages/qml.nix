{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "qml";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      kdePackages.qtdeclarative
    ];
  };
}
