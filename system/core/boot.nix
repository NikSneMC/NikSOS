{pkgs, ...}: {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["fat32" "ext4" "btrfs" "ntfs"];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 3;
    kernelParams = [
      # "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        catppuccin.enable = true;
      };
      timeout = 5;
    };

    plymouth = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
