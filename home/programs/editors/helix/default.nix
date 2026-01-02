{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./languages
    ./themes.nix
    ./keys.nix
  ];

  programs.helix = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "helix-wrapped";
      paths = [inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default];
      preferLocalBuild = true;
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = let
        runtime =
          pkgs.callPackage (import ./runtime.nix {inherit config inputs;}) {} |> toString;
      in ''
        wrapProgram $out/bin/hx \
          --suffix HELIX_RUNTIME : ${runtime}
      '';
    };

    defaultEditor = true;
    settings = {
      theme = "catppuccin_${config.theme.flavor}-transparent";
      editor = {
        line-number = "relative";
        completion-trigger-len = 1;
        completion-replace = true;
        bufferline = "multiple";
        color-modes = true;
        trim-trailing-whitespace = true;
        rainbow-brackets = true;
        lsp = {
          display-progress-messages = true;
          display-inlay-hints = true;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        indent-guides = {
          render = true;
          character = "╎";
        };
        soft-wrap.enable = true;
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
      };
    };
  };

  catppuccin.helix.enable = false;
}
