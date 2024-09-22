{
  config,
  pkgs,
  ...
}: {
  home.packages = [ pkgs.gh ];

  # enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    delta = {
      enable = true;
      catppuccin.enable = true;
    };
    extraConfig = {
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
    };

    aliases = {
      a = "add";
      b = "branch";
      c = "commit";
      ca = "commit --amend";
      cm = "commit -m";
      co = "checkout";
      d = "diff";
      ds = "diff --staged";
      p = "push";
      pf = "push --force-with-lease";
      pl = "pull";
      l = "log";
      r = "rebase";
      s = "status --short";
      ss = "status";
      forgor = "commit --amend --no-edit";
      graph = "log --all --decorate --graph --oneline";
      oops = "checkout --";
    };

    extraConfig.safe.directory = [ "*" ];

    ignores = [
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      "node_modules"
      "venv"
      ".idea"
      "kls_database.db"
      "**/.project"
      "**/.settings"
      "**/.classpath"
      "**/.factorypath"
      "**/bin"
    ];

    extraConfig.credential.helper = "store";
    userEmail = "commits@niksne.ru";
    userName = "NikSne";

    signing = {
      key = "${config.home.homeDirectory}/.ssh/git_sign";
      signByDefault = true;
    };
    extraConfig.gpg.format = "ssh";
  };
}
