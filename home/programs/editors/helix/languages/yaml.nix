{pkgs, ...}: {
  programs.helix = {
    extraPackages = with pkgs; [
      yaml-language-server
      yamlfmt
    ];
  };
}
