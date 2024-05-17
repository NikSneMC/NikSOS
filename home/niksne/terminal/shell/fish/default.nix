{
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
      nrs = "nh os switch -a";
      nrsr = "nrs && systemctl reboot";
      nrss = "nrs && systemctl poweroff";
      nrsu = "nh os boot -a -u";
      nrsur = "nrsu && systemctl reboot";
      nrsus = "nrsu && systemctl poweroff";
      nsgc = "sudo nix-store --gc";
      ngc = "sudo nix-collect-garbage -d";
      lock = "hyprctl dispatch exec hyprlock";
      unlock = "pkill -USR1 hyprlock";
      nixbtw = "neofetch";
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
      # --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
      # --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
      # --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

      starship init fish | source
    '';
    functions.fish_greeting.body = '''';
  };
}
