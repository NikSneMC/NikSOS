{lib, ...}: {
  programs.nixvim.plugins.neocord.enable = lib.mkForce false;
}
