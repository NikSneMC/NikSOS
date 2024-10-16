{pkgs, ...}: {
  environment.pathsToLink = ["/share/fish"];

  programs = {
    less.enable = true;

    fish.enable = true;
  };
  users.defaultUserShell = pkgs.fish;
}
