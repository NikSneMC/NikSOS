{
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.git;
  key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC80U0KdtQQ8zYepNqnCznBtk9CdQ+R+97UaUjD/m6cX niksne@table-niksne";
in {
  home.packages = [pkgs.gh];

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

    ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig = {
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = config.home.homeDirectory + "/" + config.xdg.configFile."git/allowed_signers".target;
      };
    };

    userEmail = "commits@niksne.ru";
    userName = "NikSne";

    extraConfig = {
      safe.directory = [
        "/etc/nixos"
      ];
    };
  };
  xdg.configFile."git/allowed_signers".text = ''
    ${cfg.userEmail} namespaces="git" ${key}
  '';
}
