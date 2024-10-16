{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    catppuccin.enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = [
      pkgs.mpvScripts.mpris
    ];
  };
}
