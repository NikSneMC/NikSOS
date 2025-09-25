{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "dockerfile";
          auto-format = true;
        }
        {
          name = "docker-compose";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      docker-language-server
    ];
  };
}
