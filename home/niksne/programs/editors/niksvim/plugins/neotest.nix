{lib, ...}: let
  mkServersList = servers:
    builtins.listToAttrs (
      builtins.map
      (server: lib.nameValuePair server {enable = true;})
      servers
    );
in {
  programs.nixvim.plugins.neotest = {
    enable = true;
    adapters = mkServersList [
      "bash"
      "elixir"
      "golang"
      "gradle"
      "gtest"
      "haskell"
      "java"
      "python"
      "scala"
      "vitest"
    ];
  };
}
