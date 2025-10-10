{pkgs, ...}: {
  imports = [
    ./lazygit.nix
  ];

  home.packages = with pkgs; [
    gh
  ];

  # enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    delta.enable = true;

    extraConfig = {
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
      pull.rebase = false;
    };

    extraConfig.safe.directory = ["*"];

    ignores = [
      "*~"
      "*.swp"
      "*result*"
      "kls_database.db"
      "**/.project"
      "**/.settings"
      "**/.classpath"
      "**/.factorypath"
      "**/bin"
    ];

    extraConfig.credential.helper = "store";

    signing.signByDefault = true;
    extraConfig.gpg.format = "ssh";
  };
}
