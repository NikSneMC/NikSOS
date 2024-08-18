{
  config,
  theme,
  ...
}: let
  palette = theme."${config.theme.flavor}";
in {
  imports = [
    ./functions
  ];
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
      nrs = "nh os switch -a path:/etc/nixos";
      nrsr = "nrs && systemctl reboot";
      nrss = "nrs && systemctl poweroff";
      nrsu = "nh os boot -a -u path:/etc/nixos";
      nrsur = "nrsu && systemctl reboot";
      nrsus = "nrsu && systemctl poweroff";
      nsgc = "sudo nix-store --gc";
      ngc = "sudo nix-collect-garbage -d";
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

      set -gx PATH $HOME/.cargo/bin $PATH

      set fish_vi_force_cursor
      set fish_cursor_default block
      set fish_cursor_insert line blink
      set fish_cursor_visual underscore blink

      # set -Ux FZF_DEFAULT_OPTS "\
      # --color=bg+:${palette.palette.surface0},bg:${palette.palette.base},spinner:${palette.palette.rosewater},hl:${palette.palette.red} \
      # --color=fg:${palette.palette.text},header:${palette.palette.red},info:${palette.palette.mauve},pointer:${palette.palette.rosewater} \
      # --color=marker:${palette.palette.rosewater},fg+:${palette.palette.text},prompt:${palette.palette.mauve},hl+:${palette.palette.red}"

      starship init fish | source
    '';
    functions.fish_greeting.body = '''';
  };
}
