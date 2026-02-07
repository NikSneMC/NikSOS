{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) readFile fromTOML concatLists groupBy attrValues attrNames;
  inherit (lib) zipAttrs mergeAttrsList recursiveUpdate;

  mkHelixLangs = pkgs: langfiles: commonLSPs: commonPackages: let
    defaultLanguageConfig =
      "${inputs.helix}/languages.toml"
      |> readFile
      |> fromTOML;

    customLanguagesConfig =
      langfiles
      |> map (langfile: import langfile {inherit inputs pkgs;})
      |> map (contents: contents.programs.helix)
      |> zipAttrs;

    customLanguageConfig' = customLanguagesConfig.languages;

    customLanguageConfig = {
      language =
        customLanguageConfig'
        |> map (
          {language ? [], ...}:
            language
        )
        |> concatLists;

      language-server =
        customLanguageConfig'
        |> map (
          {language-server ? {}, ...}:
            language-server
        )
        |> mergeAttrsList;

      grammar =
        customLanguageConfig'
        |> map (
          {grammar ? [], ...}:
            grammar
        )
        |> concatLists;

      use-grammars =
        customLanguageConfig'
        |> map (
          {use-grammars ? {}, ...}:
            use-grammars
        )
        |> mergeAttrsList;
    };

    combineLists = list:
      list
      |> groupBy (obj: obj.name)
      |> attrValues
      |> map mergeAttrsList;

    commonLSPNames = attrNames commonLSPs;

    customLanguagePackages = concatLists customLanguagesConfig.extraPackages;
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
          recursiveUpdate defaultLanguageConfig.language-server customLanguageConfig.language-server
          |> recursiveUpdate commonLSPs;
        grammar = defaultLanguageConfig.grammar ++ customLanguageConfig.grammar |> combineLists;
        use-grammars = lib.recursiveUpdate defaultLanguageConfig.use-grammars customLanguageConfig.use-grammars;
      };

      extraPackages = customLanguagePackages ++ commonPackages;
    };
  };
in {
  inherit mkHelixLangs;
}
