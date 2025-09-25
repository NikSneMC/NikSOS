{pkgs, ...}: {
  programs.helix = {
    extraPackages = with pkgs; [
      gopls
    ];
  };
}
