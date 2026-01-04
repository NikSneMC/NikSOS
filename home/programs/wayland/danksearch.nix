{
  config,
  inputs,
  pkgs,
  ...
}: let
  inherit (builtins) mapAttrs attrValues;

  mkIndexPaths = exclude_dirs: paths:
    paths
    |> mapAttrs (homePath: opts: let
      path = "${config.home.homeDirectory}/${homePath}";
    in
      opts // {inherit path exclude_dirs;})
    |> attrValues;
in {
  imports = [
    inputs.danksearch.homeModules.dsearch
  ];

  programs.dsearch = {
    enable = true;
    package = pkgs.dsearch;
    config = {
      index_paths = let
        exclude_dirs = [
          # JavaScript/Node.js
          "node_modules"
          "bower_components"
          ".npm"
          ".yarn"

          # Python
          "site-packages"
          "__pycache__"
          ".venv"
          "venv"
          ".tox"
          ".pytest_cache"
          ".eggs"

          # Build outputs
          "dist"
          "build"
          "out"
          "bin"
          "obj"

          # Rust
          "target"

          # Go
          "vendor"

          # Java/JVM
          ".gradle"
          ".m2"

          # Ruby
          "bundle"

          # Cache directories
          ".cache"
          ".parcel-cache"
          ".next"
          ".nuxt"

          # OS specific
          "Library"
          ".Trash-1000"
          ".direnv"
          ".envrc"

          # Databases
          ".postgresql"
          ".mysql"
          ".mongodb"
          ".redis"

          # Package manager caches
          "go"
          ".cargo"
          ".pyenv"
          ".rbenv"
          ".nvm"
          ".rustup"

          # IDE/Editor
          ".idea"
          ".vscode"

          # VCS
          ".git"
        ];
      in
        mkIndexPaths exclude_dirs {
          "Documents".max_depth = 6;
          "Projects".max_depth = 20;
          "tmp" = {
            max_depth = 20;
          };
        };
    };
  };
}
