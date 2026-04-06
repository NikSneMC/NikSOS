{...}: {
  programs.helix = {
    languages = {
      language-server.lisette-lsp = {
        command = "lis";
        args = ["lsp"];
      };
      language = [
        {
          name = "lisette";
          scope = "source.lisette";
          injection-regex = "lis|lisette";
          file-types = ["lis"];
          roots = ["lisette.toml"];
          auto-format = true;
          comment-tokens = ["//" "///"];
          language-servers = ["lisette-lsp"];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
        }
      ];
      grammar = [
        {
          name = "lisette";
          source = {
            git = "https://github.com/ivov/lisette";
            rev = "2f76686f3bd4d54ca99303a8d5e20a3f1609e354";
            subpath = "editors/tree-sitter-lisette";
          };
        }
      ];
    };
  };
}
