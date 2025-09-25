{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "markdown";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      marksman
    ];
  };
}
