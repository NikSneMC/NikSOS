_: let
  mkTooltip = icon: tooltip: color: class: ''"{ \"text\":\"${icon}\", \"tooltip\": \"${tooltip} <span color='#${color}'>${class}</span>\", \"class\": \"${class}\" }"'';
  mkTooltips = colors: enabled: disabled: tooltip: {
    on = mkTooltip enabled tooltip colors.green "on";
    off = mkTooltip disabled tooltip colors.maroon "off";
  };
in {
  inherit mkTooltip mkTooltips;
}
