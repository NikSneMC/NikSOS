{
  config,
  theme,
  ...
}: {
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
      set -gx EDITOR codium
      set -gx VOLUME_STEP 5
      set -gx BRIGHTNESS_STEP 5

      set -gx PATH $HOME/.cargo/bin $PATH

      set fish_vi_force_cursor
      set fish_cursor_default block
      set fish_cursor_insert line blink
      set fish_cursor_visual underscore blink

      # set -Ux FZF_DEFAULT_OPTS "\
      # --color=bg+:${theme.palette.surface0},bg:${theme.palette.base},spinner:${theme.palette.rosewater},hl:${theme.palette.red} \
      # --color=fg:${theme.palette.text},header:${theme.palette.red},info:${theme.palette.mauve},pointer:${theme.palette.rosewater} \
      # --color=marker:${theme.palette.rosewater},fg+:${theme.palette.text},prompt:${theme.palette.mauve},hl+:${theme.palette.red}"

      starship init fish | source
    '';
    functions.fish_greeting.body = '''';
  };
}
