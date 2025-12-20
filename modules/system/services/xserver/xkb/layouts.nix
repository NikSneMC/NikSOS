cfg: {
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf cfg.enable {
    services.xserver.xkb.extraLayouts = let
      inherit (builtins) readDir attrNames readFile mapAttrs attrValues concatLists listToAttrs;
      inherit (lib) filterAttrs nameValuePair;

      listLangSymbols = lang: _:
        "${./symbols}/${lang}"
        |> readDir
        |> filterAttrs (_: type: type == "regular")
        |> attrNames;

      mkLanfgLayouts = lang:
        map (symbolsFileName:
          nameValuePair symbolsFileName {
            languages = [lang];
            description = "${symbolsFileName} (${lang})";
            symbolsFile = readFile "${./symbols}/${lang}/${symbolsFileName}" |> pkgs.writeText "xkb-layout-${symbolsFileName}";
          });
    in
      readDir ./symbols
      |> filterAttrs (_: type: type == "directory")
      |> mapAttrs listLangSymbols
      |> mapAttrs mkLanfgLayouts
      |> attrValues
      |> concatLists
      |> listToAttrs;
  };
}
