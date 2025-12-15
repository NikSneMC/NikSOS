{
  lib,
  pkgs,
  ...
}: {
  programs.cargo = {
    enable = true;
    settings = {
      build = {
        build-dir = "{cargo-cache-home}";
        rustc-wrapper = "${lib.getExe pkgs.sccache}";
      };
    };
  };
}
