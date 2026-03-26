{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (lib) nameValuePair;
in {
  imports = [inputs.dms-plugin-registry.homeModules.default];

  programs.dank-material-shell.plugins =
    [
      "alarmClock"
      "calculator"
      "catWidget"
      "commandRunner"
      "dankBatteryAlerts"
      "dankKDEConnect"
      "dankLauncherKeys"
      "dankNotepadModule"
      "dankPomodoroTimer"
      "emojiLauncher"
      "niriWindows"
      "webSearch"
    ]
    |> map (plugin: nameValuePair plugin {enable = true;})
    |> listToAttrs;
}
