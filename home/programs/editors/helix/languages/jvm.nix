{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "java";
          auto-format = true;
        }
        {
          name = "kotlin";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      jdt-language-server
      kotlin-language-server
    ];
  };
}
