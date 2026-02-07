{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "sql";
          auto-format = true;
          formatter.command = "sleek";
        }
      ];
    };

    extraPackages = with pkgs; [
      sleek
    ];
  };
}
