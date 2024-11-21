{
  config,
  lib,
  pkgs,
  ...
}: let
  mkValueString = value:
    if lib.isBool value
    then
      if value
      then "true"
      else "false"
    else if lib.isInt value
    then toString value
    else if (value._type or "") == "literal"
    then value.value
    else if lib.isString value
    then ''"${value}"''
    else if lib.isList value
    then "[ ${lib.strings.concatStringsSep "," (map mkValueString value)} ]"
    else abort "Unhandled value type ${builtins.typeOf value}";

  mkKeyValue = {
    sep ? ": ",
    end ? ";",
  }: name: value: "${name}${sep}${mkValueString value}${end}";

  mkRasiSection = name: value:
    if lib.isAttrs value
    then let
      toRasiKeyValue = lib.generators.toKeyValue {mkKeyValue = mkKeyValue {};};
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
        }
        name
        value)
      + "\n";

  toRasi = attrs:
    lib.pipe [
      (lib.filterAttrs (n: _: n == "@theme") attrs)
      (lib.filterAttrs (n: _: n == "@import") attrs)
      (removeAttrs attrs ["@theme" "@import"])
    ] [
      (lib.concatMap (lib.mapAttrsToList mkRasiSection))
      (lib.concatStringsSep "\n")
    ];

  inherit (config.lib.formats.rasi) mkLiteral;
  script-2fa =
    pkgs.writeScript "rofi-script-2fa"
    ''
      #!/usr/bin/env python
      from sys import argv
      from json import load
      from subprocess import check_output


      if len(argv) not in {1, 2}:
          raise Exception

      def parse_account(entry: dict) -> tuple[str, str]:
          return f"{entry['name']}@{entry['issuer']}".lower(), entry["info"]["secret"]

      with open(file="${config.home.homeDirectory}/.2fa.json", mode="r", encoding="utf-8") as f:
          accounts: dict[str, str] = dict(map(parse_account, load(f)["db"]["entries"]))

      if len(argv) == 1:
          for account in accounts.keys():
              print(account)
      else:
          if argv[1] in accounts.keys():
              check_output(["notify-send", f"Copied token for {argv[1]}!"])
              check_output(["wl-copy", check_output(["${lib.getExe pkgs.oath-toolkit}", "--totp", "-b", accounts[argv[1]]])])
          else:
              check_output(["notify-send", f"No 2FA secret found for {argv[1]}"])

    '';
  script-clipboard =
    pkgs.writeScript "rofi-script-clipboard.sh"
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
      bg-col = mkLiteral "#${config.theme.colors.base}";
      bg-col-light = mkLiteral "#${config.theme.colors.base}";
      border-col = mkLiteral "#${config.theme.colors.accent}";
      selected-col = mkLiteral "#${config.theme.colors.base}";
      accent = mkLiteral "#${config.theme.colors.accent}";
      fg-col = mkLiteral "#${config.theme.colors.text}";
      fg-col2 = mkLiteral "#${config.theme.colors.red}";
      grey = mkLiteral "#${config.theme.colors.overlay0}";

      width = 600;
      font = "JetBrainsMono Nerd Font 10";
    };

    "element-text, element-icon, mode-switcher" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    window = {
      height = mkLiteral "100%";
      width = mkLiteral "20%";
      margin = mkLiteral "10px";
      border = mkLiteral "3px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "@border-col";
      background-color = mkLiteral "@bg-col";
    };

    mainbox = {
      background-color = mkLiteral "@bg-col";
    };

    inputbar = {
      children = mkLiteral "[prompt, entry]";
      background-color = mkLiteral "@bg-col";
      border-radius = mkLiteral "5px";
      padding = mkLiteral "2px";
    };

    prompt = {
      background-color = mkLiteral "@accent";
      padding = mkLiteral "6px";
      text-color = mkLiteral "@bg-col";
      border-radius = mkLiteral "3px";
      margin = mkLiteral "20px 0 0 20px";
    };

    textbox-prompt-colon = {
      expand = false;
      str = " =";
    };

    entry = {
      padding = mkLiteral "6px";
      margin = mkLiteral "20px 0 0 10px";
      text-color = mkLiteral "@fg-col";
      background-color = mkLiteral "@bg-col";
    };

    listview = {
      border = mkLiteral "0";
      padding = mkLiteral "6px 0 0";
      margin = mkLiteral "10px 0 0 20px";
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
      background-color = mkLiteral "@selected-col";
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
      margin = mkLiteral "20px 0 0 20px";
      text-color = mkLiteral "@accent";
      background-color = mkLiteral "@bg-col-light";
    };
  };
in {
  programs.rofi = {
    enable = true;
    catppuccin.enable = false;
    package = pkgs.rofi-wayland;
    location = "right";
    terminal = "wezterm";
    extraConfig =
      common-config
      // {
        modes = "run,drun,filebrowser,2fa:${script-2fa}";
        display-run = "  ";
        display-drun = " 󰵆 ";
        display-filebrowser = " 󰥨 ";
        display-2fa = " 󰦯 ";
        "// bad way to do this" = config.lib.formats.rasi.mkLiteral ''

            filebrowser {
              directory: "~";
              sorting-method: "name";
              directories-first: true;
            }
          // I'll fix it later'';
      };
    theme = rofi-theme;
  };

  xdg.configFile."rofimoji.rc".text = ''
    action = copy
    files = [emoji, arrows, block_elements, box_drawing, currency_symbols, gitmoji, hiragana, katakana, math, mathematical_operators]
    skin-tone = neutral
    max-recent = 0
    use-icons = true
  '';

  xdg.configFile."rofi/clipboard.rasi".text = toRasi {
    configuration =
      common-config
      // {
        location = 4;
        terminal = "wezterm";
        modes = "log:${script-clipboard},emoji:${lib.getExe pkgs.rofimoji}";
        display-emoji = " 󰞅 ";
        display-log = " 󱃔 ";
      };
    "@theme" = "custom";
  };
}
