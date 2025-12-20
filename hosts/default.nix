{helpers, ...}: {
  flake.nixosConfigurations = helpers.mkHosts {
    konran = {
      tags = ["desktop"];
      users = ["niksne"];
    };

    nakama = {
      tags = ["laptop"];
      users = ["niksnes"];
    };

    tobichi = {
      tags = ["wsl"];
      users = ["niksne"];
    };

    renga = {
      tags = ["avf"];
      users = ["niksne"];
    };
  };
}
