{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "just";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      just-lsp
    ];
  };
}
