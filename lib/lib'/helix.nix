{
  inputs,
  lib,
  ...
}: let
  mkHelixLangs = pkgs: langfiles: commonLSPs: commonPackages: let
    defaultLanguageConfig = "${inputs.helix}/languages.toml" |> builtins.readFile |> builtins.fromTOML;

    customLanguagesConfig =
      langfiles
      |> map (langfile: import langfile {inherit inputs pkgs;})
      |> map (contents: contents.programs.helix)
      |> lib.zipAttrs;

    customLanguageConfig' = customLanguagesConfig.languages;

    customLanguageConfig = {
      language =
        customLanguageConfig'
        |> map (
          {language ? [], ...}:
            language
        )
        |> builtins.concatLists;

      language-server =
        customLanguageConfig'
        |> map (
          {language-server ? {}, ...}:
            language-server
        )
        |> lib.mergeAttrsList;

      grammar =
        customLanguageConfig'
        |> map (
          {grammar ? [], ...}:
            grammar
        )
        |> builtins.concatLists;

      use-grammars =
        customLanguageConfig'
        |> map (
          {use-grammars ? {}, ...}:
            use-grammars
        )
        |> lib.mergeAttrsList;
    };

    combineLists = list: list |> builtins.groupBy (obj: obj.name) |> builtins.attrValues |> map lib.mergeAttrsList;

    commonLSPNames = builtins.attrNames commonLSPs;

    customLanguagePackages = builtins.concatLists customLanguagesConfig.extraPackages;
  in {
    programs.helix = {
      languages = {
        language =
          defaultLanguageConfig.language
          ++ customLanguageConfig.language
          |> combineLists
          |> map (
            {language-servers ? [], ...} @ lang:
              lang // {language-servers = language-servers ++ commonLSPNames;}
          );
        language-server =
          lib.recursiveUpdate defaultLanguageConfig.language-server customLanguageConfig.language-server
          |> lib.recursiveUpdate commonLSPs;
        grammar = defaultLanguageConfig.grammar ++ customLanguageConfig.grammar |> combineLists;
        use-grammars = lib.recursiveUpdate defaultLanguageConfig.use-grammars customLanguageConfig.use-grammars;
      };

      extraPackages = customLanguagePackages ++ commonPackages;
    };
  };
in {
  inherit mkHelixLangs;
}
