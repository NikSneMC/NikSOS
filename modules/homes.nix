{
  config,
  options,
  osConfig,
  ...
}: {
  options.home = {
    user = options.home.username;
  };

  config = {
    home = {
      inherit (osConfig.system) stateVersion;

      username = config.home.user;
      homeDirectory = "/home/${config.home.user}";
    };

    manual = {
      html.enable = false;
      json.enable = false;
      manpages.enable = false;
    };

    programs.home-manager.enable = true;
  };
}
