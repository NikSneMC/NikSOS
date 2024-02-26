{ pkgs, ... }:

{
    services.xserver = {
        enable = true;
        videoDrivers = [ "amdgpu" ]; 
        displayManager = {
            defaultSession = "hyprland";
            setupCommands = "Hyprland";
            sddm = {
                enable = true;
                package = pkgs.libsForQt5.sddm;
                wayland.enable = true;
                autoNumlock = true;
                theme = "catppuccin-mocha";
                settings = {
                    Theme = {
                        ThemeDir = "/usr/share/sddm/themes/";
                    };
                };
            };
            # gdm = {
            #     enable = true;
            #     wayland = true;
            # };
        };
    };
}