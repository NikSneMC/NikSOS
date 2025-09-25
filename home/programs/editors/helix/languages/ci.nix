{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "gitlab-ci";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      gitlab-ci-ls
    ];
  };
}
