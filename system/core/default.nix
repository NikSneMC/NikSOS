{lib, ...}: {
  imports = [
    ./xkb
    ./boot.nix
    ./security.nix
  ];

  i18n = {
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  # don't touch this
  system.stateVersion = lib.mkDefault "24.11";

  time.timeZone = lib.mkDefault "Europe/Moscow";
}
