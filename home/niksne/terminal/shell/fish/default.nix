{
  config,
  ...
}: {
  imports = [ ./functions ];

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
    shellInit = ''
      set -gx EDITOR vi
      set -gx VOLUME_STEP 5
      set -gx BRIGHTNESS_STEP 5

      # --color=bg+:#${config.theme.colors.surface0},bg:#${config.theme.colors.base},spinner:#${config.theme.colors.rosewater},hl:#${config.theme.colors.red} \
      # --color=fg:#${config.theme.colors.text},header:#${config.theme.colors.red},info:#${config.theme.colors.mauve},pointer:#${config.theme.colors.rosewater} \
      # --color=marker:#${config.theme.colors.rosewater},fg+:#${config.theme.colors.text},prompt:#${config.theme.colors.mauve},hl+:#${config.theme.colors.red}"

      starship init fish | source
    '';
    functions.fish_greeting.body = '''';
  };
}
