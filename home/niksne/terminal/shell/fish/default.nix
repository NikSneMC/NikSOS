{config, ...}: {
  imports = [./functions];

  programs.fish = {
    enable = true;
    shellAliases = {
      cl = "clear";
      conf = "cd ~/.config";
      nixos = "cd /etc/nixos";
      nixos-private = "cd /etc/nixos/hosts/${config.home.host}/private";
      store = "cd /nix/store";
      projects = "cd ~/Projects";
      nfu = "nix flake update";
      nrt = "nh os test     -a path:/etc/nixos --";
      nrs = "nh os switch   -a path:/etc/nixos --";
      nrb = "nh os boot     -a path:/etc/nixos --";
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
      nixbtw = "fastfetch";
      nixvim = "nvim";
      npm = "pnpm";
      npx = "pnpx";
    };
    shellInit = ''
      starship init fish | source
      fish_vi_key_bindings
    '';
    functions.fish_greeting.body = '''';
  };
}
