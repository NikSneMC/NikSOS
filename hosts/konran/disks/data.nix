let
  mkSubvolumes = subvolumes:
    subvolumes
    |> map (
      subvolume:
        if builtins.isString subvolume
        then {
          name = subvolume;
          value = {
            mountpoint = subvolume;
          };
        }
        else {
          name = subvolume.mountpoint;
          value = subvolume;
        }
    )
    |> builtins.listToAttrs;

  mkUserSubvolumes = user: folders:
    folders
    |> map (folder: {
      mountpoint = "/home/${user}/${folder}";
      mountOptions = ["compress=zstd"];
    })
    |> mkSubvolumes;
in {
  disko.devices.disk.sda = {
    type = "disk";
    device = "/dev/disk/by-id/ata-WDC_WD20EFRX-68EUZN0_WD-WCC4M3XSK0TC";
    content = {
      type = "gpt";
      partitions = {
        data = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = ["-f"];
            subvolumes = mkUserSubvolumes "niksne" [
              ".gradle"
              ".local/share"
              ".thunderbird"
              ".zen"
              "Documents"
              "Downloads"
              "Music"
              "Pictures"
              "Projects"
              "Public"
              "Templates"
              "tmp"
              "Videos"
            ];
          };
        };
      };
    };
  };
}
