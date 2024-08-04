{
  lib,
  inputs,
  pkgs,
  ...
}:{
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

  environment.systemPackages = [ 
    inputs.self.packages.${pkgs.system}.spoofDPI
  ];
}
