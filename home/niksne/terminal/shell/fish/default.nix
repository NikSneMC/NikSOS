{config, ...}: {
  imports = [./functions];

  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    shellAliases = {
      cl = "clear";
      conf = "cd ~/.config";
      nixos = "cd /etc/nixos";
      store = "cd /nix/store";
      projects = "cd ~/Projects";
      nfu = "nixos && nix flake update";
      nfuc = "nixos && nix flake lock --update-input";
      nrs = "nh os switch -a path:/etc/nixos -- --impure";
      nrb = "hn os boot -a path:/etc/nixos -- --impure";
      nrsr = "nrs && systemctl reboot";
      nrss = "nrs && systemctl poweroff";
      nrsu = "nh os boot -a -u path:/etc/nixos -- --impure";
      nrsur = "nrsu && systemctl reboot";
      nrsus = "nrsu && systemctl poweroff";
      ngc = "sudo nh clean all";
      lock = "hyprctl dispatch exec hyprlock";
      unlock = "pkill -USR1 hyprlock";
      nixbtw = "fastfetch";
      nixvim = "nvim";
      npm = "pnpm";
      npx = "pnpx";
    };
    shellInit = with config.theme.colors; ''
      set -gx VOLUME_STEP 5
      set -gx BRIGHTNESS_STEP 5

      # --color=bg+:#${surface0},bg:#${base},spinner:#${rosewater},hl:#${red} \
      # --color=fg:#${text},header:#${red},info:#${mauve},pointer:#${rosewater} \
      # --color=marker:#${rosewater},fg+:#${text},prompt:#${mauve},hl+:#${red}"

      starship init fish | source
    '';
    functions.fish_greeting.body = '''';
  };
}
