let
  mkSubvolumes = subvolumes:
    builtins.listToAttrs (
      builtins.map (
        mountpoint: {
          name = mountpoint;
          value = {
            mountOptions = ["compress=zstd"];
            inherit mountpoint;
          };
        }
      )
      subvolumes
    );

  mkUserSubvolumes = user: folders: mkSubvolumes (builtins.map (folder: "/home/${user}/${folder}") folders);
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
