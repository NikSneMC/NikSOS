{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "latex";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      texlab
    ];
  };
}
