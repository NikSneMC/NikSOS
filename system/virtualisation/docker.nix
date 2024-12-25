{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  users.extraGroups.docker.members = ["niksne"];
}
