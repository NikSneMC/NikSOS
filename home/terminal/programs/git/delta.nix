{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  # enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";
}
