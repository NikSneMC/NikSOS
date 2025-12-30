{
  lib,
  pkgs,
  ...
}: {
  programs.cargo = {
    enable = true;
    settings = {
      build = {
        rustc-wrapper = "${lib.getExe pkgs.sccache}";
      };
    };
  };
}
