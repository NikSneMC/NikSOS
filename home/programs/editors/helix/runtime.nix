{
  config,
  inputs,
}: {
  stdenv,
  lib,
  symlinkJoin,
  includeGrammarIf ? _: true,
  grammarOverlays ? [],
  ...
}: let
  bundledLanguagesConfig =
    builtins.fromTOML (builtins.readFile "${inputs.helix}/languages.toml");
  languagesConfig = config.programs.helix.languages;
  isGitGrammar = grammar:
    builtins.hasAttr "source" grammar
    && builtins.hasAttr "git" grammar.source
    && builtins.hasAttr "rev" grammar.source;
  isGitHubGrammar = grammar: lib.hasPrefix "https://github.com" grammar.source.git;
  toGitHubFetcher = url: let
    match = builtins.match "https://github\.com/([^/]*)/([^/]*)/?" url;
  in {
    owner = builtins.elemAt match 0;
    repo = builtins.elemAt match 1;
  };
  # If `use-grammars.only` is set, use only those grammars.
  # If `use-grammars.except` is set, use all other grammars.
  # Otherwise use all grammars.
  useGrammar = grammar:
    if languagesConfig ? use-grammars.only
    then builtins.elem grammar.name languagesConfig.use-grammars.only
    else if languagesConfig ? use-grammars.except
    then !(builtins.elem grammar.name languagesConfig.use-grammars.except)
    else true;

  bundledGrammars = bundledLanguagesConfig.grammar |> map (grammar: grammar.name);
  grammarsToUse = languagesConfig.grammar |> builtins.filter ({name, ...}: !(builtins.elem name bundledGrammars)) |> builtins.filter useGrammar;
  gitGrammars = builtins.filter isGitGrammar grammarsToUse;
  buildGrammar = grammar: let
    gh = toGitHubFetcher grammar.source.git;
    sourceGit = builtins.fetchTree {
      type = "git";
      url = grammar.source.git;
      rev = grammar.source.rev;
      ref = grammar.source.ref or "HEAD";
      shallow = true;
    };
    sourceGitHub = builtins.fetchTree {
      type = "github";
      owner = gh.owner;
      repo = gh.repo;
      inherit (grammar.source) rev;
    };
    source =
      if isGitHubGrammar grammar
      then sourceGitHub
      else sourceGit;
  in
    stdenv.mkDerivation {
      # see https://github.com/NixOS/nixpkgs/blob/fbdd1a7c0bc29af5325e0d7dd70e804a972eb465/pkgs/development/tools/parsing/tree-sitter/grammar.nix

      pname = "helix-tree-sitter-${grammar.name}";
      version = grammar.source.rev;

      src = source;
      sourceRoot =
        if builtins.hasAttr "subpath" grammar.source
        then "source/${grammar.source.subpath}"
        else "source";

      dontConfigure = true;

      FLAGS = [
        "-Isrc"
        "-g"
        "-O3"
        "-fPIC"
        "-fno-exceptions"
        "-Wl,-z,relro,-z,now"
      ];

      NAME = grammar.name;

      buildPhase = ''
        runHook preBuild

        if [[ -e src/scanner.cc ]]; then
          $CXX -c src/scanner.cc -o scanner.o $FLAGS
        elif [[ -e src/scanner.c ]]; then
          $CC -c src/scanner.c -o scanner.o $FLAGS
        fi

        $CC -c src/parser.c -o parser.o $FLAGS
        $CXX -shared -o $NAME.so *.o

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/grammars
        mv $NAME.so $out/grammars
        if [[ -e queries ]]; then
          mkdir -p $out/queries/$NAME
          cp -r queries/* $out/queries/$NAME/
          find $out/queries/$NAME -type l -delete
        fi
        runHook postInstall
      '';

      # Strip failed on darwin: strip: error: symbols referenced by indirect symbol table entries that can't be stripped
      fixupPhase = lib.optionalString stdenv.isLinux ''
        runHook preFixup
        $STRIP $out/grammars/$NAME.so
        runHook postFixup
      '';
    };
  grammarsToBuild = builtins.filter includeGrammarIf gitGrammars;
  builtGrammars =
    builtins.map (grammar: {
      inherit (grammar) name;
      value = buildGrammar grammar;
    })
    grammarsToBuild;
  extensibleGrammars =
    lib.makeExtensible (_self: builtins.listToAttrs builtGrammars);
  overlaidGrammars =
    lib.pipe extensibleGrammars
    (builtins.map (overlay: grammar: grammar.extend overlay) grammarOverlays);
in
  symlinkJoin {
    name = "helix-runtime";
    paths = overlaidGrammars |> lib.filterAttrs (_: v: lib.isDerivation v) |> builtins.attrValues;
    preferLocalBuild = true;
  }
