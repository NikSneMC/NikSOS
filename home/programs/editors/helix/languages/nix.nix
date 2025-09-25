{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
        }
      ];

      language-server.nil = {
        config = {
          nil.formatting.command = [
            "alejandra"
            "-q"
          ];
        };
      };
    };

    extraPackages = with pkgs; [
      nil
      alejandra
    ];
  };
}
