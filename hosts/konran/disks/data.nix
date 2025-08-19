let
  inherit (import (../../../lib + "/lib'/disks.nix") {}) mkUserSubvolumes;
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
