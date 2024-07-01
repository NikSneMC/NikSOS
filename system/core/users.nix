{
  pkgs,
  ...
}: {
  users.users = {
    niksne = {
      isNormalUser = true;
      description = "NikSne";
      shell = pkgs.fish;
      extraGroups = [
        "input"
        "networkmanager"
        "video"
        "wheel" 
        "minecraft"
      ];
    };
    udalex = {
      isNormalUser = true;
      description = "Alex Udaltsov";
    };
  };
}
