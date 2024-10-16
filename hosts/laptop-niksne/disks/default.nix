let
  mkSubvolumes = subvolumes:
    builtins.listToAttrs (
      builtins.map (
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
      subvolumes
    );
in {
  disko.devices.disk.sda = {
    type = "disk";
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_250GB_S4BFNX0NA04092R";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          priority = 1;
          name = "ESP";
          start = "1M";
          end = "513M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = ["-f"];
            subvolumes = mkSubvolumes [
              "/"
              {
                mountOptions = ["compress=zstd"];
                mountpoint = "/home";
              }
              {
                mountOptions = ["compress=zstd" "noatime"];
                mountpoint = "/nix";
              }
              # {
              #    mountpoint = "/.swapvol";
              #    swap.swapfile.size = "32G";
              #  }
            ];
            mountpoint = "/";
            # swap.swapfile.size = "32G";
          };
        };
      };
    };
  };
}
