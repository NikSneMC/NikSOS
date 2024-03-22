{ pkgs, ... }:

{
    # Bootloader.
    boot = {
        loader = {
            grub = {
                enable = true;
                device = "/dev/sda";
                useOSProber = true;
                theme = pkgs.catppuccin.override {
                    accent = "teal";
                    variant = "mocha";
                    themeList = [ "grub" ];
                };
                extraConfig = "set theme=/boot/theme/grub/theme.txt\nGRUB_GFXMODE=1366x768"; # FIXME edit your resolution
            };
            timeout = 3;
        };
        initrd = {
            enable = true;
            systemd.enable = true;
        };
        plymouth = {
            enable = true;
            font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
            extraConfig = "Theme=catppuccin-mocha";
        };
}
