{pkgs, ...}: {
  users.users = {
    WarlOrd = {
      isNormalUser = true;
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
