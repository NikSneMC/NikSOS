{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./languages
    ./themes.nix
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;

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
