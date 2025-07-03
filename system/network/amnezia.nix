{
  config,
  pkgs,
  ...
}: {
  boot.extraModulePackages = with config.boot.kernelPackages; [
    amneziawg
  ];

  environment.systemPackages = with pkgs; [
    amneziawg-tools
  ];

  programs.amnezia-vpn.enable = true;
}
