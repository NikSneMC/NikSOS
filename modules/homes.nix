{
  config,
  inputs,
  lib,
  options,
  ...
}: {
  options.home = {
    host = lib.mkOption {
      description = '''';
      type = lib.types.str;
    };
    user = options.home.username;
  };

  config = {
    home = {
      username = config.home.user;
      homeDirectory = "/home/${config.home.user}";
      stateVersion = "24.11";
      file.".face".source = "${inputs.assets}/users/${config.home.user}.png";
    };

    manual = {
      html.enable = false;
      json.enable = false;
      manpages.enable = false;
    };

    programs.home-manager.enable = true;
  };
}
