{...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "surrealql";
          scope = "source.surrealql";
          file-types = ["surql"];
          comment-tokens = ["--" "//" "#"];
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          injection-regex = "surql";
        }
      ];
      grammar = [
        {
          name = "surrealql";
          source = {
            git = "https://github.com/Ce11an/tree-sitter-surrealql";
            rev = "8eda53c708592d32f0c705a7f8d13d4727502e2d";
          };
        }
      ];
    };
  };
}
