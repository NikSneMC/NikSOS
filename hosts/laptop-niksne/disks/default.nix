{lib, ...}: let
  inherit (import (../../../lib + "/lib'/disks.nix") {inherit lib;}) mkSubvolumes;
in {
  disko.devices.disk.nvme0n1 = {
    type = "disk";
    device = "/dev/disk/by-id/nvme-KINGSTON_OM8PCP3512F-AI1_50026B76842EC49B";
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
            ];
            mountpoint = "/";
            swap.swapfile.size = "16G";
          };
        };
      };
    };
  };
}
