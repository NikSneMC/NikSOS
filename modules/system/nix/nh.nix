{
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
    clean = {
      enable = true;
      dates = "Sat *-*-* 03:00";
      extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
