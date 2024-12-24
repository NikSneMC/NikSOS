{lib, ...}: let
  mkMappings = modes: mapping: lib.genAttrs (lib.stringToCharacters modes) (_: mapping);
in {
  programs.nixvim.plugins.better-escape = {
    enable = true;
    settings = {
      default_mappings = false;
      mappings = mkMappings "cistv" {j.k = "<Esc>";};
    };
  };
}
