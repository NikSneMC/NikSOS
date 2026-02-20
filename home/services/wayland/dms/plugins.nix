{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (lib) nameValuePair;
in {
  imports = [inputs.dms-plugin-registry.modules.default];

  programs.dank-material-shell.plugins =
    [
      "alarmClock"
      "calculator"
      "commandRunner"
      "dankBatteryAlerts"
      "dankKDEConnect"
      "dankPomodoroTimer"
      "developerUtilities"
      "emojiLauncher"
      "niriWindows"
      "webSearch"
    ]
    |> map (plugin: nameValuePair plugin {enable = true;})
    |> listToAttrs;
}
