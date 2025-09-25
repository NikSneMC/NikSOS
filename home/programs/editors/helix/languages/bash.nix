{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "bash";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      bash-language-server
    ];
  };
}
