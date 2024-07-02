{
  config,
  lib,
  pkgs,
  theme,
  ...
}: let
  mkValueString = value:
    if lib.isBool value then
      if value then "true" else "false"
    else if lib.isInt value then
      toString value
    else if (value._type or "") == "literal" then
      value.value
    else if lib.isString value then
      ''"${value}"''
    else if lib.isList value then
      "[ ${lib.strings.concatStringsSep "," (map mkValueString value)} ]"
    else
      abort "Unhandled value type ${builtins.typeOf value}";

  mkKeyValue = { sep ? ": ", end ? ";" }:
    name: value:
    "${name}${sep}${mkValueString value}${end}";

  mkRasiSection = name: value:
    if lib.isAttrs value then
      let
        toRasiKeyValue = lib.generators.toKeyValue { mkKeyValue = mkKeyValue { }; };
        # Remove null values so the resulting config does not have empty lines
        configStr = toRasiKeyValue (lib.filterAttrs (_: v: v != null) value);
      in ''
        ${name} {
        ${configStr}}
      ''
    else
      (mkKeyValue {
        sep = " ";
        end = "";
      } name value) + "\n";

  toRasi = attrs:
    lib.concatStringsSep "\n" (lib.concatMap (lib.mapAttrsToList mkRasiSection) [
      (lib.filterAttrs (n: _: n == "@theme") attrs)
      (lib.filterAttrs (n: _: n == "@import") attrs)
      (removeAttrs attrs [ "@theme" "@import" ])
    ]);

  inherit (config.lib.formats.rasi) mkLiteral;
  script-2fa = pkgs.writeScript "rofi-script-2fa.sh" 
    ''
      #!/usr/bin/env bash

      if [ -z "$1" ]
      then
        accts=$( ls -1 $HOME/.2fa )
        echo -en "\0no-custom\x1ftrue\n"
        echo -en "$accts\n"
        exit 0
      fi

      if ! [ -f "$HOME/.2fa/$1" ]
      then
        notify-send "No 2FA secret found for $1"
        exit 1
      fi

      # capture stdout (code), stderr (any oathtool error), and exit code
      eval "$({ reserr=$({ res=$(cat "$HOME/.2fa/$1" | oathtool --totp -b - ); resret=$?; } 2>&1; declare -p res resret >&2); declare -p reserr; } 2>&1)"


      if [ $resret -ne 0 ]
      then
        notify-send "oath error = $reserr"
        exit 1
      fi

      notify-send "Copied token for $1!"
      wl-copy $res
      exit 0
    '';
  script-clipboard = pkgs.writeScript "rofi-script-clipboard.sh"
    ''
      #!/usr/bin/env bash

      tmp_dir="/tmp/cliphist"
      rm -rf "$tmp_dir"

      if [[ -n "$1" ]]; then
          cliphist decode <<<"$1" | wl-copy
          exit
      fi

      mkdir -p "$tmp_dir"

      read -r -d "" prog <<EOF
      /^[0-9]+\s<meta http-equiv=/ { next }
      match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
          system("echo " grp[1] "\\\\\t | cliphist decode >$tmp_dir/"grp[1]"."grp[3])
          print \$0"\0icon\x1f$tmp_dir/"grp[1]"."grp[3]
          next
      }
      1
      EOF
      cliphist list | gawk "$prog"
    '';
  common-config = {
    icon-theme = "Numix-Circle";
    show-icons = true;
    drun-display-format = "{icon} {name}";
    disable-history = false;
    hide-scrollbar = true;
    sidebar-mode = true;
  };
  rofi-theme = {
    "*" = {
      bg-col = mkLiteral theme.palette.base;
      bg-col-light = mkLiteral theme.palette.base;
      border-col = mkLiteral theme.palette.${config.theme.accent};
      selected-col = mkLiteral theme.palette.base;
      accent = mkLiteral theme.palette.${config.theme.accent};
      fg-col = mkLiteral theme.palette.text;
      fg-col2 = mkLiteral theme.palette.red;
      grey = mkLiteral theme.palette.overlay0;

      width = 600;
      font = "JetBrainsMono Nerd Font 10";
    };

    "element-text, element-icon , mode-switcher" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    window = {
      height = mkLiteral "100%";
      width = mkLiteral "20%";
      margin = mkLiteral"10px";
      border = mkLiteral "3px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "@border-col";
      background-color = mkLiteral "@bg-col";
    };

    mainbox = {
      background-color = mkLiteral "@bg-col";
    };

    inputbar = {
      children = mkLiteral "[prompt,entry]";
      background-color = mkLiteral "@bg-col";
      border-radius = mkLiteral "5px";
      padding = mkLiteral "2px";
    };

    prompt = {
      background-color = mkLiteral "@accent";
      padding = mkLiteral "6px";
      text-color = mkLiteral "@bg-col";
      border-radius = mkLiteral "3px";
      margin = mkLiteral "20px 0px 0px 20px";
    };

    textbox-prompt-colon = {
      expand = false;
      str = " =";
    };

    entry = {
      padding = mkLiteral "6px";
      margin = mkLiteral "20px 0px 0px 10px";
      text-color = mkLiteral "@fg-col";
      background-color = mkLiteral "@bg-col";
    };

    listview = {
      border = mkLiteral "0px 0px 0px";
      padding = mkLiteral "6px 0px 0px";
      margin = mkLiteral "10px 0px 0px 20px";
      columns = 1;
      lines = 5;
      background-color = mkLiteral "@bg-col";
    };

    element = {
      padding = mkLiteral "5px";
      background-color = mkLiteral "@bg-col";
      text-color = mkLiteral "@fg-col";
    };

    element-icon = {
      size = mkLiteral "25px";
    };

    "element selected" = {
      background-color =  mkLiteral "@selected-col";
      text-color = mkLiteral "@fg-col2";
    };

    mode-switcher = {
      spacing = 0;
    };

    button = {
      padding = mkLiteral "10px";
      background-color = mkLiteral "@bg-col-light";
      text-color = mkLiteral "@grey";
      vertical-align = mkLiteral "0.5"; 
      horizontal-align = mkLiteral "0.5";
    };

    "button selected" = {
      background-color = mkLiteral "@bg-col";
      text-color = mkLiteral "@accent";
    };

    message = {
      background-color = mkLiteral "@bg-col-light";
      margin = mkLiteral "2px";
      padding = mkLiteral "2px";
      border-radius = mkLiteral "5px";
    };

    textbox = {
      padding = mkLiteral "6px";
      margin = mkLiteral "20px 0px 0px 20px";
      text-color = mkLiteral "@accent";
      background-color = mkLiteral "@bg-col-light";
    };
  };
in {
  home.packages = with pkgs; [
    rofimoji
    oath-toolkit
  ];
  
  programs.rofi = {
    enable = true;
    catppuccin.enable = false;
    package = pkgs.rofi-wayland;
    location = "right";
    terminal = "wezterm";
    extraConfig = (common-config // {
      modes = "run,drun,filebrowser,2fa:${script-2fa}";
      display-run = "  ";
      display-drun = " 󰵆 ";
      display-filebrowser = " 󰥨 ";
      display-2fa = " 󰦯 ";
      # "// bad way to do this" = config.lib.formats.rasi.mkLiteral ''

        # filebrowser = {
        #   directory = "~";
        #   sorting-method = "name";
        #   directories-first = true;
        # };
      # // I\'ll fix it'';
    });
    theme = rofi-theme;
  };

  xdg.configFile."rofimoji.rc".text = ''
    action = copy
    files = [emoji, arrows, block_elements, box_drawing, currency_symbols, gitmoji, hiragana, katakana, math, mathematical_operators,]
    skin-tone = neutral
    max-recent = 0
    use-icons = true
  '';

  xdg.configFile."rofi/clipboard.rasi".text = toRasi {
    configuration = (common-config // {
      location = 4;
      terminal = "wezterm";
      modes = "log:${script-clipboard},emoji:rofimoji";
      display-emoji = " 󰞅 ";
      display-log = " 󱃔 ";
    });
    "@theme" = "custom";
  };
}