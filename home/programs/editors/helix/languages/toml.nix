{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "toml";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      taplo
    ];
  };
}
