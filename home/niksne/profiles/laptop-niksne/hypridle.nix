{
  lib,
  pkgs,
  ...
}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    # check if any player has status "Playing"
    ${lib.getExe pkgs.playerctl} -a status | ${lib.getExe pkgs.ripgrep} Playing -q
    # only suspend if nothing is playing
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';

  brillo = lib.getExe pkgs.brillo;
in {
  services.hypridle.settings.listener = [
    {
      timeout = 225;
      on-timeout = "${brillo} -O; ${brillo} -u 1000000 -S 10";
      on-resume = "${brillo} -I -u 500000";
    }
    {
      timeout = 600;
      on-timeout = suspendScript.outPath;
    }
  ];
}
