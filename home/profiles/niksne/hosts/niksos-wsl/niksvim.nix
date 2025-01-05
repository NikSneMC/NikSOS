{lib, ...}: {
  programs.niksvim.plugins.neocord.enable = lib.mkForce false;
}
