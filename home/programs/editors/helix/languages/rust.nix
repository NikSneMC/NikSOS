{pkgs, ...}: {
  programs.helix = {
    languages = {
      language-server.rust-analyzer = {
        config = {
          check.command = "clippy";
          diagnostics.styleLints.enable = true;
        };
      };
    };

    extraPackages = with pkgs; [
      rust-analyzer
    ];
  };
}
