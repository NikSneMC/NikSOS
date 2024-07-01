{
  pkgs,
  ...
}: {
    services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
  services.printing = {
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };
  services.samba = {
    enable = true;
    package = pkgs.sambaFull;
    openFirewall = true;
    extraConfig = ''
      load printers = yes
      printing = cups
      printcap name = cups
    '';
    shares = {
     printers = {
       comment = "All Printers";
       path = "/var/spool/samba";
       public = "yes";
       browseable = "yes";
       # to allow user 'guest account' to print.
       "guest ok" = "yes";
        writable = "no";
        printable = "yes";
       "create mode" = 0700;
     };
   };
  };
  systemd.tmpfiles.rules = [
    "d /var/spool/samba 1777 root root -"
  ];
}
