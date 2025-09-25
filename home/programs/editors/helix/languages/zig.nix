{pkgs, ...}: {
  programs.helix = {
    extraPackages = with pkgs; [
      zls
    ];
  };
}
