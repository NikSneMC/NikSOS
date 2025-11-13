{pkgs, ...}: {
  imports = [
    ./delta.nix
    ./lazygit.nix
  ];

  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
      pull.rebase = false;
    };

    settings.safe.directory = ["*"];

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

    settings.credential.helper = "store";

    signing.signByDefault = true;
    settings.gpg.format = "ssh";
  };
}
