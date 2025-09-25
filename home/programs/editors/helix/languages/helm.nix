{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "helm";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      helm-ls
    ];
  };
}
