{
  lib,
  pkgs,
  ...
}: {
  systemd.services.byedpi = {
    description = "byeDPI Service";
    wantedBy = ["default.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${lib.getExe' pkgs.byedpi "ciadpi"} --split 1 --disoob 3 --disorder 7 --fake -1 --auto none --tlsrec 3+h --mod-http=h,d,r";
      TimeoutStopSec = 5;
    };
  };
}
