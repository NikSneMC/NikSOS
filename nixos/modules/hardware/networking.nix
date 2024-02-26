{ pkgs, ... }:

{
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    environment.systemPackages = with pkgs; [
        networkmanagerapplet
    ];

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
      allowedUDPPortRanges = [
        { from = 4000; to = 4007; }
        { from = 9000; to = 9999; }
      ];
    };
}