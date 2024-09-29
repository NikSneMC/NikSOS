let 
  mkSubvolumes = subvolumes: builtins.listToAttrs (
    builtins.map (
      subvolume: if builtins.isString subvolume then {
        name = subvolume;
        value = {
          mountpoint = subvolume;
        };
      } else {
        name = subvolume.mountpoint;
        value = subvolume;
      }
    )
    subvolumes
  );
in {
  disko.devices.disk.nvme0n1 = {
    type = "disk";
    device = "/dev/disk/by-id/nvme-Apacer_AS2280P4U_1TB_0E61071A075400022783_1";
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
            extraArgs = [ "-f" ]; 
            subvolumes = mkSubvolumes [
              "/"
              {
                mountOptions = [ "compress=zstd" ];
                mountpoint = "/home";
              }
              {
                mountOptions = [ "compress=zstd" "noatime" ];
                mountpoint = "/nix";
              }
              {
                mountOptions = [ "compress=zstd" ];
                mountpoint = "/srv";
              }
            ];
            mountpoint = "/";
          };
        };
      };
    };
  };
}
