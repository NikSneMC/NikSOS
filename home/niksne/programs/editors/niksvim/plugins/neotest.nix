{lib, ...}: let
  mkServersList = servers:
    lib.pipe servers [
      (builtins.map (server: lib.nameValuePair server {enable = true;}))
      builtins.listToAttrs
    ];
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
