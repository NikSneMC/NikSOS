{pkgs, ...}: {
  hardware.sane.enable = true;
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        hplipWithPlugin
        samsung-unified-linux-driver
        epson-escpr
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
