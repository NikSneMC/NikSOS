{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "python";
          auto-format = true;
          language-servers = [
            "basedpyright"
            "ruff"
          ];
        }
      ];
    };

    extraPackages = with pkgs; [
      basedpyright
      ruff
    ];
  };
}
