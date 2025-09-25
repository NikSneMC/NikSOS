{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "systemd";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      systemd-lsp
    ];
  };
}
