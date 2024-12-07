{
  imports = [
    ./amnezia.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };

    resolved.enable = true;
  };
}
