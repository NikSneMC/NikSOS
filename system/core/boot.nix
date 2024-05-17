{
  npkgs,
  config,
  ...
}: {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "fat32" "ext4" "btrfs" "ntfs" ];
    };

    kernelPackages = npkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      grub = {
  	    enable = true;
        theme = "${npkgs.catppuccin}/grub/";
      };
      timeout = 5;
    };

    plymouth = {
      enable = true;
      themePackages = with npkgs; [
        catppuccin-plymouth
      ];
      theme = "catppuccin-mocha";
    };
  };
}
