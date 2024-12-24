{
  services = {
    avahi.publish = {
      enable = true;
      userServices = true;
    };
    printing = {
      listenAddresses = ["*:631"];
      allowFrom = ["all"];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
    };
  };
}
