{pkgs, ...}: {
  boot.extraModulePackages = with pkgs.linuxKernel.packages.linux_zen; [
    amneziawg
  ];

  environment.systemPackages = with pkgs; [
    amneziawg-tools
  ];
}
