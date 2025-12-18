{pkgs, ...}: {
  users.users = {
    niksne = {
      isNormalUser = true;
      initialHashedPassword = "$y$j9T$l4DeIv1F4IavM4cZ662Um1$TLzF2xx.thPu5otqumFf9vpMZKX87.uEol5O0wqHWk5";
      description = "NikSne";
      shell = pkgs.fish;
      extraGroups = [
        "input"
        "networkmanager"
        "video"
        "wheel"
      ];
    };
  };
}
