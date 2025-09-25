{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "python";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      ruff
    ];
  };
}
