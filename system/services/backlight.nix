{
  pkgs,
  ...
}: {
  hardware.brillo.enable = true;

  services.geoclue2.appConfig = {
      "gammastep" = {
        isAllowed = true;
        isSystem = false;
        users = [ "1000" ]; # FIXME: set your user id (to get user id use command 'id -u "your_user_name"')
      };
  };

  environment.systemPackages = with pkgs; [
    gammastep
  ];
}