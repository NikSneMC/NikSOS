{helpers, ...}: {
  flake.homeConfigurations = helpers.mkHomes {
    niksne = {
      hosts = [
        "konran"
        "nakama"
        "tobichi"
        "renga"
      ];
    };
  };
}
