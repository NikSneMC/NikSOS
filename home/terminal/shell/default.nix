{
  imports = [
    ./fish
    ./starship.nix
  ];

  home.shellAliases = {
    cl = "clear";
    nfu = "nix flake update";
    nrt = "nh  os test    -a path:/etc/nixos --";
    nrs = "nh  os switch  -a path:/etc/nixos --";
    nrb = "nh  os boot    -a path:/etc/nixos --";
    nrbu = "nh os boot -u -a path:/etc/nixos --";
    nrsr = "nrs   && systemctl reboot";
    nrbr = "nrb   && systemctl reboot";
    nrbur = "nrsu && systemctl reboot";
    nrss = "nrs   && systemctl poweroff";
    nrbs = "nrb   && systemctl poweroff";
    nrbus = "nrsu && systemctl poweroff";
    ngc = "sudo nh clean all";
    lock = "hyprctl dispatch exec hyprlock";
    unlock = "pkill -10 hyprlock";
    jq = "jaq";
    fetch = "fastfetch";
  };
}
