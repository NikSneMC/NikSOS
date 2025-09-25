{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "fish";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      fish-lsp
    ];
  };
}
