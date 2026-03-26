{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";

    autoPrune.enable = true;
  };

  users.users.niksne.extraGroups = ["docker"];
  environment.systemPackages = with pkgs; [
    lazydocker
  ];
}
