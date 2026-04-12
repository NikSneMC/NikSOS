{...}: {
  programs.helix = {
    languages = {
      language-server.rust-analyzer = {
        config = {
          check.command = "clippy";
          diagnostics.styleLints.enable = true;
        };
      };
    };
  };
}
